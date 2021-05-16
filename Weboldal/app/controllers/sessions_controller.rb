class SessionsController < ApplicationController
  def create
    @user = User.authenticate params[:email], params[:password]
    if @user
      session[:user] = @user.id
      flash[:notice] = 'Sikeres bejelentkezés!'      
      redirect_to images_path
    else
      flash[:notice] = 'Helytelen email cím vagy jelszó!'
      redirect_back fallback_location: loginpage_path
    end
  end

  def destroy
    reset_session
    flash[:notice] = 'Sikeres kijelentkezés!'
    redirect_to loginpage_path
  end
end
