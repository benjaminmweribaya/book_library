require "test_helper"

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @book = books(:available_book)
    @borrowed_book = books(:borrowed_book)
    @borrowing = borrowings(:one) # Ensure this borrowing record exists in fixtures

    # Simulate user login
    post login_path, params: { email: @user.email, password: "password" }
  end

  test "should return a book successfully" do
    borrowing = borrowings(:one)
    assert borrowing.returned_at.nil?

    patch return_book_borrowing_path(borrowing.book_id)

    assert_redirected_to user_profile_path(@user)
    assert_not flash[:notice].empty?
    borrowing.reload
    assert_not_nil borrowing.returned_at
  end

  test "should handle invalid return request" do
    # Trying to return a book that isn't borrowed by the current user
    patch return_book_borrowing_path(@book.id)

    assert_redirected_to root_path
    assert_not flash[:alert].empty?
  end

  test "should redirect to login if not authenticated" do
    delete logout_path
    patch return_book_borrowing_path(@borrowed_book.id)

    assert_redirected_to login_path
  end
end
