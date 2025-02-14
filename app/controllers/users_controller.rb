class UsersController < ApplicationController
  before_action :authenticate_user!, except: [ :new, :create ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id  # Log in the user after signup
      redirect_to user_profile_path, notice: "Account created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = current_user
    @borrowings = @user.borrowings.includes(:book).where(returned_at: nil)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
