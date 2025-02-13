require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @book = books(:one)
    @borrowed_book = books(:two)
    @borrowed_book.borrowings.create(user: @user, due_date: 2.weeks.from_now)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get show" do
    get book_url(@book)
    assert_response :success
  end

  test "should borrow available book" do
    sign_in_as(@user)
    post borrow_book_url(@book)
    assert_redirected_to user_path(@user)
    assert @book.borrowings.exists?(user: @user)
  end

  test "should not borrow unavailable book" do
    sign_in_as(@user)
    post borrow_book_url(@borrowed_book)
    assert_redirected_to book_url(@borrowed_book)
    assert_match "already borrowed", flash[:alert]
  end

  test "should return borrowed book" do
    sign_in_as(@user)
    post return_book_url(@borrowed_book)
    assert_redirected_to user_path(@user)
    assert @borrowed_book.borrowings.find_by(user: @user).returned_at.present?
  end
end
