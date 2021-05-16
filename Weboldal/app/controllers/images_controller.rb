class ImagesController < ApplicationController
  def index
    logged_in_checker
  end

  def new
    logged_in_checker
  end

  def show
    logged_in_checker
  end

  def upload
    image = Image.save_file(params[:image], @user.id)
    redirect_to image;
  end

  private
  def logged_in_checker
    if !session[:user]
      redirect_to loginpage_path
    end
  end
end
