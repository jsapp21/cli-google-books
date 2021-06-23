class Book < ActiveRecord::Base
    has_many :lists
    has_many :users, through: :lists

    def self.insert_or_find_book(book)
        Book.find_or_create_by(author: book[:author], title: book[:title], publisher: book[:publisher])
    end

end
