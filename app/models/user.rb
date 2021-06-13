class User < ActiveRecord::Base
    has_many :lists
    has_many :books, through: :lists
    
end