class User < ActiveRecord::Base
    has_many :lists
    has_many :books, through: :lists

    def self.find_or_create_user(name)
        user = User.find_by(name: name)
        if user
            puts "Welcome back!"
            user 
        else
            puts "Your username was created."
            User.create(name: name)
        end
    end

    def insert_books(selectedBooksArr)

        selectedBooksArr.each do |book|
            bookExists = Book.find_by(title: book[:title])
            if bookExists
                list = List.find_or_create_by(book_id: bookExists[:id], user_id: self.id)
                puts 'this is already one of your books'
            else
                bookNew = Book.create(author: book[:author], title: book[:title], publisher: book[:publisher])
                list = List.find_or_create_by(book_id: bookNew[:id], user_id: self.id)
                puts 'added book to reading list'
            end
        end
        binding.pry
        0

    end
    
end