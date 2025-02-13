require "test_helper"

class BooksIndexViewTest < ActionDispatch::IntegrationTest
  setup do
    @available_book = books(:available) # Assuming a book not borrowed
    @borrowed_book = books(:borrowed) # Assuming a book already borrowed
  end

  test "should display all books with correct availability status" do
    get books_path
    assert_response :success
    assert_select "h1", "Book Listing"

    # Check if available book is displayed correctly
    assert_select ".book-title", @available_book.title
    assert_select ".availability", text: "Available"

    # Check if borrowed book is displayed correctly
    assert_select ".book-title", @borrowed_book.title
    assert_select ".availability", text: "Not Available"
  end
end
