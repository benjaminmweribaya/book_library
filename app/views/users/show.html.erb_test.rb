require "test_helper"

class UsersShowViewTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @borrowed_book = books(:borrowed)
    @borrowing = borrowings(:one)
    post login_path, params: { email: @user.email, password: "password" }
  end

  test "should display borrowed books on user profile" do
    get user_profile_path
    assert_response :success
    assert_select "h1", "Your Profile"
    assert_select ".borrowed-books .book-title", text: @borrowed_book.title
    assert_select ".due-date", text: @borrowing.due_date.to_s
  end
end
