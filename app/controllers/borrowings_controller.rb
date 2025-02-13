class BorrowingsController < ApplicationController
  before_action :set_borrowing, only: [ :return_book ]

  def return_book
    if @borrowing.update(returned_at: Time.current)
      flash[:notice] = "Book successfully returned."
    else
      flash[:alert] = "Failed to return the book. Please try again."
    end
    redirect_to user_profile_path(current_user)
  end

  private

  def set_borrowing
    @borrowing = Borrowing.find_by(user: current_user, book_id: params[:id], returned_at: nil)
    unless @borrowing
      flash[:alert] = "Invalid return request."
      redirect_to root_path
    end
  end
end
