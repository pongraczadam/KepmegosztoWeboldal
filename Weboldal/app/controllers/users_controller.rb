class UsersController < ApplicationController
  def login
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:user] = 'Sikeres regisztráció!'
      session[:user] = @user.id
      redirect_to imagesindex_path
    else
      flash[:user] = @user.errors.messages
      redirect_to  register_path
    end
  end

  def forgotten
  end

  def send_forgotten
  end

  private
  def user_params
    params.require(:user).permit([:name, :email, :password, :password_confirmation])
  end
end
