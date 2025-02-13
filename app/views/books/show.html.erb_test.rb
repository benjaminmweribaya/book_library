require "test_helper"

class BooksShowViewTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @book = books(:available)
    post login_path, params: { email: @user.email, password: "password" }
  end

  test "should display book details and borrow button if available" do
    get book_path(@book)
    assert_response :success
    assert_select "h1", @book.title
    assert_select ".author", @book.author
    assert_select ".isbn", @book.isbn
    assert_select "form[action=?]", borrow_book_path(@book)
  end
end
