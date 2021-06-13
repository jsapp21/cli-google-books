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
        puts 'user dashboard page'

        search = gets.chomp
    end
    

end
