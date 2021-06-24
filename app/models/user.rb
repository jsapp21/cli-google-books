class User < ActiveRecord::Base
    has_many :lists
    has_many :books, through: :lists

    def self.find_user(name)
        @user = User.find_by(name: name)
    end

    def self.create_user(name)
        @user = User.create(name: name)
    end

    def user_books
        self.books.any?
    end

    def refresh_user
        self.reload 
    end

    def book_list
        self.books
    end
    
end