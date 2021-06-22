class User < ActiveRecord::Base
    has_many :lists
    has_many :books, through: :lists

    def insert_books(selectedBooksArr)
        selectedBooksArr.each do |book|
            bookExists = Book.find_by(title: book[:title])
            if bookExists
                list = List.find_or_create_by(book_id: bookExists[:id], user_id: self.id)
                puts '❗️ This book is already on your Reading List ❗️'
                sleep 1
            else
                bookNew = Book.create(author: book[:author], title: book[:title], publisher: book[:publisher])
                list = List.find_or_create_by(book_id: bookNew[:id], user_id: self.id)
                puts '✅  This book was added book to Reading List ✅ '
                sleep 1
            end
        end
    end
    
end