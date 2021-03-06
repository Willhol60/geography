class WishesController < ApplicationController
  before_action :find_wish, only: [:edit, :update, :destroy]

  def index
    @wishes = current_user.wishes.all
  end

  def new
    @wish = Wish.new
  end

  def create
    @wish = Wish.new(wish_params)
    @wish.user = current_user
    if @wish.save
      redirect_to wishes_path
      flash.notice = "You'll make it there soon!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @wish.update(wish_params)
      redirect_to wishes_path
    else
      render :edit
    end
  end

  def destroy
    @wish.destroy
    redirect_to wishes_path
  end

  private

  def wish_params
    params.require(:wish).permit(:country_id, :date, :notes)
  end

  def find_wish
    @wish = Wish.find(params[:id])
  end
end
