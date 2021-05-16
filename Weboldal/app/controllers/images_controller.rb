class ImagesController < ApplicationController
  def logged_in_checker
    if !session[:user]
      redirect_to loginpage_path
    end
  end

  def index
    logged_in_checker
  end

  def new
    logged_in_checker
  end

  def show
    logged_in_checker
  end
end
