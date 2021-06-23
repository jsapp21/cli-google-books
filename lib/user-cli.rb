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
            menu_prompt
        end
    end
end

def log_off
    puts "Goodbye #{@user.name}!"
    sleep 1
    clear_terminal
end 