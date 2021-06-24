require "spec_helper"
require_relative '../app/models/user'

describe User do
    it "new user created" do 
        user = User.new(name: 'James')

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
        book = Book.new(title: "The Amazing Spider Man", author: "Stan Lee", publisher: "Marvel")
        user = User.find_by(name: 'James')
        list = List.new(user_id: user.id, book_id: book.id)

        expect(user.user_books).to be_truthy
    end

    it "user does not have any saved books" do
        user = User.new(name: 'Asia')

        expect(user.user_books).to be_falsey
    end

end