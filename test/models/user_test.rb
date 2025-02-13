require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without email" do
    user = User.new(password: "password123")
    assert_not user.save, "Saved the user without an email"
  end

  test "should not allow duplicate email" do
    user1 = User.create(email: "test@example.com", password: "password123")
    user2 = User.new(email: "test@example.com", password: "password1234")
    assert_not user2.save, "Saved a user with duplicate email"
  end

  test "password should be at least 6 characters long" do
    user = User.new(email: "test@example.com", password: "12345")
    assert_not user.save, "Saved a user with a short password"
  end
end
