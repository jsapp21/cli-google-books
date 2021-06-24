require "spec_helper"
require_relative '../app/models/book'

describe Book do 

    it "new book was created" do
        book = Book.new(title: "To Kill a Mockingbird", author: "Harper Lee", publisher: "N/A")

        expect(Book.insert_or_find_book(book)).to be_truthy
    end

    it "book is already a book" do
        book = Book.new(title: "To Kill a Mockingbird", author: "Harper Lee", publisher: "N/A")
        book_2 = Book.new(title: "To Kill a Mockingbird", author: "Harper Lee", publisher: "N/A")

        expect(Book.insert_or_find_book(book_2)).to be_truthy
    end
end