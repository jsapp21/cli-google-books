class User < ActiveRecord::Base
    has_many :lists
    has_many :books, through: :lists

    def self.find_user(name)
      @user = User.find_by(name: name)
    end

    def self.create_user(name)
        @user = User.create(name: name)
    end

    def self.user_books
        @user.books.any?
    end

    def self.refresh_user
        @user.reload 
    end

    def self.book_list
        @user.books
    end
    
end