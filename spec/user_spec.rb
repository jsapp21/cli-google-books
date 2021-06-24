require "spec_helper"
require_relative '../app/models/user'

# stop relying on the database, make your own inputs

describe User do
    it "new user created" do 
        user = User.create_user('James')

        expect(user.name).to eq('James')
    end

    it "user is found" do
        user = User.find_user('James')

        expect(user.name).to eq('James')
    end

    it "user is not found" do
        user = User.find_user('Melissa')

        expect(user).to eq(nil)
    end

    it "user has list of books" do
        book = Book.create(title: "The Amazing Spider Man", author: "Stan Lee", publisher: "Marvel")
        user = User.find_by(name: 'James')
        list = List.create(user_id: user.id, book_id: book.id)

        expect(user.user_books).to be_truthy
    end

    it "user does not have any saved books" do
        user = User.create(name: 'Asia')

        expect(user.user_books).to be_falsey
    end

    # it "user was reloaded" do
    #     user = User.create(name: 'Asia')

    #     expect(user.refresh_user).to be_nil
    # end



end