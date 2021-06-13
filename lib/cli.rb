class CLI

    def run
        puts 'Hello 8th Light!'
        sign_in_or_create_user
        
    end

    def sign_in_or_create_user
        prompt = TTY::Prompt.new
        options = ["Login", "Create a new user"]
        prompt.select("Select an option:", options) 

        login  
    end

    def login
        puts "Enter your username:" 
        
        name = gets.chomp 
        @user = User.find_or_create_user(name)
        sleep 2
        user_dashboard 
    end

    def user_dashboard
        puts 'USER DASHBOARD'
        prompt = TTY::Prompt.new
        prompt.ask("Search google books...")

        search = gets.chomp

        get_search(search)
        
    end

    def get_search(search)

        url = "https://www.googleapis.com/books/v1/volumes?q="
        maxFive = "&maxResults=5"

        final_url = url + search + maxFive

        response = RestClient.get(final_url)
        parsed_search = JSON.parse(response.body)

        choices = []
        # choices = [
        #     { key: "1", name: "overwrite this file", value: :yes },
        #     { key: "2", name: "do not overwrite this file", value: :no },
        #     { key: "3", name: "overwrite this file and all later files", value: :all },
        #     { key: "4", name: "show diff", value: :diff },
        #     { key: "5", name: "quit; do not overwrite this file ", value: :quit }
        #   ]
        
        i = 0
        5.times do
        book = {}
        book[:title] = parsed_search['items'][i]['volumeInfo']['title'] || 'N/A'

        if parsed_search['items'][i]['volumeInfo']['authors'].count <= 1
            book[:author] = parsed_search['items'][i]['volumeInfo']['authors'][0] || 'N/A'
        else 
            book[:author] = parsed_search['items'][i]['volumeInfo']['authors'].join(" & ")
        end

        book[:publisher] = parsed_search['items'][i]['volumeInfo']['publisher'] || 'N/A'


        eachBook = 'Book: ' + book[:title] + ', Author: ' + book[:author] + ', Publishing Company: ' + book[:publisher]
        
        choices.push({key: i, name: eachBook, value: book})
        i += 1
        end
        
        prompt = TTY::Prompt.new
        selectedBooksArr = prompt.multi_select("Select books?", choices)

        @user.insert_books(selectedBooksArr)
        # binding.pry 
        # 0
    end


end
