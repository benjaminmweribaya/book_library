require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(email: "test@example.com", password: "password123")
  end

  test "should get login page" do
    get login_path
    assert_response :success
  end

  test "should log in with valid credentials" do
    post login_path, params: { email: @user.email, password: "password123" }
    assert_redirected_to root_path
    assert_equal @user.id, session[:user_id]
    follow_redirect!
    assert_select "div", "Logged in successfully"
  end

  test "should not log in with invalid credentials" do
    post login_path, params: { email: @user.email, password: "wrongpassword" }
    assert_response :success
    assert_nil session[:user_id]
    assert_select "div.alert", "Invalid email or password"
  end

  test "should log out user" do
    post login_path, params: { email: @user.email, password: "password123" }
    delete logout_path
    assert_redirected_to root_path
    assert_nil session[:user_id]
    follow_redirect!
    assert_select "div", "Logged out successfully"
  end
end
