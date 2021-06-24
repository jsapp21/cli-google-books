class List < ActiveRecord::Base
    belongs_to :user
    belongs_to :book 
    
    def self.check_list_for_book(bookExists, id)
        List.find_by(book_id: bookExists[:id], user_id: id)
    end

    def self.add_book_to_list(bookExists, id)
        List.create(book_id: bookExists[:id], user_id: id)
    end

end
