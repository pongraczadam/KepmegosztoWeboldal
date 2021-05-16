class UsersController < ApplicationController
  def logged_in_checker
    if session[:user]
      redirect_to images_path
    end
  end

  def login
    logged_in_checker
  end

  def new
    logged_in_checker
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:user] = 'Sikeres regisztráció!'
      session[:user] = @user.id
      redirect_to images_path
    else
      flash[:user] = @user.errors.messages
      redirect_to  register_path
    end
  end

  def forgotten
    logged_in_checker
  end

  def send_forgotten
  end

  private
  def user_params
    params.require(:user).permit([:name, :email, :password, :password_confirmation])
  end
end
