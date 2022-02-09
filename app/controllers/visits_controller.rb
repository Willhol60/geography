require "pry"
require "mini_magick"

class VisitsController < ApplicationController
  def index
    @visits = Visit.latest.all
  end

  def show
    @visit = Visit.find(params[:id])
    # @photo_array = []
    # visit.photos.each do |photo|
    #   # @photo_array << MiniMagick::Image.open(photo).resize("100x100").format("png").write("#{photo}.png")
    #   @photo_array << MiniMagick::Image.open(photo).write("#{photo}.png")
    # end
    # @image = MiniMagick::Image.open("input.jpg")
    # image.path #=> "/var/folders/k7/6zx6dx6x7ys3rv3srh0nyfj00000gn/T/magick20140921-75881-1yho3zc.jpg"
    # image.resize "100x100"
    # image.format "png"
    # image.write "output.png"
  end

  def new
    @visit = Visit.new
  end

  def create
    @visit = Visit.new(visit_params)
    @visit.user = current_user
    if @visit.save!
      flash.notice = "One more trip added!"
      redirect_to visits_path
    else
      flash.alert = "Uh oh - didn't work"
      render new
    end
  end

  def edit
    @visit = Visit.find(params[:id])
  end

  def update
    visit = Visit.find(params[:id])
    if visit.update(visit_params)
      redirect_to visits_path
    else
      render flash
      render :edit
    end
  end

  def destroy
    visit = Visit.find(params[:id])
    visit.destroy
    redirect_to visits_path
  end

  private

  def visit_params
    params.require(:visit).permit(:country_id, :date, :notes, photos: [])
  end
end
