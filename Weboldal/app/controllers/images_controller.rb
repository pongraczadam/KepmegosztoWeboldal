class ImagesController < ApplicationController
  iclude Favourite
  before_action :set_image, only: %i[ show edit destroy download addtofavourite removefromfavourite ]

  def index
    logged_in_checker
    @images = Image.all
  end

  def new
    logged_in_checker
  end

  def show
    logged_in_checker
  end

  def upload
    image = Image.save_file(params[:image], @user.id)
    if image == nil
      flash[:notice] = 'Hibás feltöltés. Csak képet lehet feltölteni!'
      redirect_back fallback_location: new_image_path
    else
      flash[:notice] = 'Sikeres feltöltés!'
      redirect_to image;
    end
  end

  def download
    send_file @image.path, type: @image.mime
  end

  def destroy
    if !(@image.user_id == @user.id)
      @image.destroy
      flash[:notice] = 'A kép törölve!'
      redirect :back
    end
  end

  def addtofavourite
    f = Favourite.new
    f.user_id = @user.id
    f.image_id = image_id
    f.save
  end

  def removefromfavourite
  end

  private
  def logged_in_checker
    if !session[:user]
      redirect_to loginpage_path
    end
  end

  def set_image
    @image = Image.find(params[:id])
  end
end
