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
    
end