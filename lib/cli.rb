class CLI

    def run
        puts 'Google 📚'
        prompt = TTY::Prompt.new
        options = ["Login", "Create a new user"]
        selection = prompt.select("Select an option:", options) 

        if selection == 'Login'
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
            puts '❗️ Username cannot be blank. Try again❗️'
            sleep 1
            create_new_user
        else
            @user = User.find_user(name)
            if @user
                puts "❗️ Username is already taken, try again❗️"
                sleep 1
                create_new_user
            else
                @user = User.create_user(name)
                puts "✅  Your username was created! ✅ "
                sleep 1
                clear_terminal
                menu_prompt
            end
        end 
    end

    def login
        clear_terminal
        puts "Enter your username:" 
        name = gets.chomp 

        if name.length < 1
            puts '❗️ Username cannot be blank, try again❗️'
            sleep 1
            login
        else
            @user = User.find_user(name)
            if @user
                puts "Welcome back! #{@user.name}"
                sleep 1
                clear_terminal
                menu_prompt
            else
                puts "❗️ Username could not be found, try again❗️"
                sleep 1
                clear_terminal
                login
            end
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
            if User.user_books
                view_reading_list
            else
                puts "Sorry, you have no books saved."
                sleep 1
                menu_prompt
            end
        else menu_choice == "Log Off"
            log_off
        end
    end

    def view_reading_list
        clear_terminal 
        puts "#{@user.name} Reading List:" 

        @user = User.refresh_user
        user_book_list = User.book_list
        user_book_list.each do |book|
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
