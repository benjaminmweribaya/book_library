require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "should not save book without title, author, and isbn" do
    book = Book.new
    assert_not book.save, "Saved the book without a title, author, and ISBN"
  end

  test "should not allow duplicate ISBN" do
    book1 = Book.create(title: "Test Book", author: "Author", isbn: "1234567890")
    book2 = Book.new(title: "Another Book", author: "Another Author", isbn: "1234567890")
    assert_not book2.save, "Saved a book with duplicate ISBN"
  end

  test "should return true for available book" do
    book = books(:available_book)
    assert book.available?, "Book should be available"
  end
end
