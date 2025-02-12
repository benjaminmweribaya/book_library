class BooksController < ApplicationController
  before_action :set_book, only: [ :show, :borrow, :return ]

  # List all books
  def index
    @books = Book.all
  end

  # Show a single book
  def show
  end

  # Borrow a book
  def borrow
    if @book.available?
      @book.borrowings.create(user: current_user, due_date: 2.weeks.from_now)
      redirect_to user_path(current_user), notice: "You have borrowed the book."
    else
      redirect_to @book, alert: "This book is already borrowed."
    end
  end

  # Return a book
  def return
    borrowing = @book.borrowings.find_by(user: current_user, returned_at: nil)

    if borrowing
      borrowing.update(returned_at: Time.current)
      redirect_to user_path(current_user), notice: "Book returned successfully."
    else
      redirect_to @book, alert: "You haven't borrowed this book."
    end
  end

  private

  # Find book by ID
  def set_book
    @book = Book.find(params[:id])
  end
end
