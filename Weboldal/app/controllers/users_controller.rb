class UsersController < ApplicationController
  def login
  end

  def new
    @user = User.new
  end

  def create
  end

  def forgotten
  end

  def send_forgotten
  end
end
