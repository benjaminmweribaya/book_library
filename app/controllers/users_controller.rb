class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @borrowings = @user.borrowings.includes(:book).where(returned_at: nil)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
