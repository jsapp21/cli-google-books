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

        final_url = url + search

        binding.pry


        response = RestClient.get(final_url)
        parsed_search = JSON.parse(response.body)
        binding.pry
        0
        # puts `#{response.cookies}`
    end
    

end
