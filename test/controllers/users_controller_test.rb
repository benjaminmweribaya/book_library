require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one) # Assuming a fixture for a user exists
    @book = books(:one) # Assuming a fixture for a book exists
    @borrowing = borrowings(:one) # Assuming a fixture for a borrowing record exists

    # Simulate user login
    post login_path, params: { email: @user.email, password: "password" }
  end

  test "should show user profile with borrowed books" do
    get user_profile_path
    assert_response :success
    assert_select "h1", "Your Profile"
    assert_select ".borrowed-books", count: 1
    assert_select ".book-title", @book.title
    assert_select ".due-date", @borrowing.due_date.to_s
  end

  test "should redirect to login if user not authenticated" do
    delete logout_path # Log out user
    get user_profile_path
    assert_redirected_to login_path
    assert_not flash.empty?
  end
end
