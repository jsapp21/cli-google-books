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
            if @user.user_books
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

    def clear_terminal
        system "clear"
    end
    
end
