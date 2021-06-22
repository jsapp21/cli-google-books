class CLI

    def run
        puts 'Google 📚'
        prompt = TTY::Prompt.new
        options = ["Login", "Create a new user"]
        prompt.select("Select an option:", options) 

        if options == 'Login'
            login
        else
            create_new_user  
        end

    end

    def create_new_user
        clear_terminal
        puts "Create your username:" 
        name = gets.chomp 

        if name.length < 1
            puts '❗️ Username cannot be blank. Try again. ❗️'
            sleep 1
            create_new_user
        else
            @user = User.create_user(name)
            clear_terminal
            menu_prompt
        end 

    end

    def login
        clear_terminal
        puts "Enter your username:" 
        
        name = gets.chomp 
        @user = User.find_or_create_user(name)
        sleep 1
        clear_terminal

        if @user
            menu_prompt
        else
            login
        end
    end

    def search_for_books
        puts "Search Google Books..."
        puts 'Try searching by author, book title, categories etc.'
        search = gets.chomp

        if search == ''
            clear_terminal
            puts '❌ You must enter text for search result ❌ '
            puts 'Try again.'
            sleep 1
            menu_prompt
        else
            get_search(search)
        end
    end

    def get_search(search)
        url = "https://www.googleapis.com/books/v1/volumes?q="
        maxFive = "&maxResults=5"
        
        final_url = url + search + maxFive
        
        clear_terminal
        response = RestClient.get(final_url)
        parsed_search = JSON.parse(response.body)


        if parsed_search['totalItems'] == 0
            clear_terminal
            puts '❌ You must enter text for search result ❌ '
            puts 'Try again.'
            sleep 1
            menu_prompt
        end

        choices = []
        i = 0

        5.times do
        book = {}
        search = parsed_search['items'][i]['volumeInfo']
        
        book[:title] = search['title'] || 'N/A'

        if !search['authors']
            book[:author] = 'N/A'
        elsif 
            search['authors'].count <= 1
            book[:author] = search['authors'][0] || 'N/A'
        else
            book[:author] = search['authors'].join(" & ")
        end
        
        book[:publisher] = search['publisher'] || 'N/A'

        eachBook = 'Book: ' + book[:title] + ', Author: ' + book[:author] + ', Publishing Company: ' + book[:publisher]
        
        choices.push({key: i, name: eachBook, value: book})
        i += 1
        end
        
        prompt = TTY::Prompt.new
        selectedBooksArr = prompt.multi_select("Select books to add to your Reading List:", choices)
        clear_terminal

        @user.insert_books(selectedBooksArr)
        clear_terminal

        menu_prompt
    end

    def menu_prompt
        prompt = TTY::Prompt.new
        display_menu = ["Search Google Books?", "View Reading List", "Log Off"]
        menu_choice = prompt.select("Select one:", display_menu)

        selection(menu_choice)
    end

    def selection(menu_choice)
        clear_terminal
        if menu_choice == "Search Google Books?"
            search_for_books 
        elsif menu_choice == "View Reading List"
            if @user.books.any? == false  
                puts "Sorry, you have no books saved."
                sleep 1
                menu_prompt
            else
                view_reading_list
            end
        else menu_choice == "Log Off"
            log_off
        end
    end

    def view_reading_list
        clear_terminal 
        puts "#{@user.name} Reading List:" 

        @user.reload 
        @user.books.each do |book|
            puts  '- Book: ' + book.title + ', Author: ' + book.author + ', Publishing Company: ' + book.publisher
        end

        menu_prompt
    end

    def log_off
        puts "Goodbye #{@user.name}!"
        sleep 1
        clear_terminal
    end 

    def clear_terminal
        system "clear"
    end
    
end
