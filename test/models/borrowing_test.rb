require "test_helper"

class BorrowingTest < ActiveSupport::TestCase
  test "should set due date on creation" do
    borrowing = Borrowing.create(user: users(:one), book: books(:available_book))
    assert_equal 2.weeks.from_now.to_date, borrowing.due_date, "Due date was not set correctly"
  end

  test "should not allow borrowing of already borrowed book" do
    borrowing1 = borrowings(:one)
    borrowing2 = Borrowing.new(user: users(:two), book: borrowing1.book)
    assert_not borrowing2.save, "Allowed borrowing of an already borrowed book"
  end
end
