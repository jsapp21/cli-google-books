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