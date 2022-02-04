class WishesController < ApplicationController
  def index
    @wishes = Wish.all
  end

  def show
    @wish = Wish.find(params[:id])
  end

  def new
    @wish = Wish.new
  end

  def create
    @wish = Wish.new(wish_params)
    if @wish.save
      redirect_to wishes_path
    else
      # render flash
      render :new
    end
  end

  def edit
    @wish = Wish.find(params[:id])
  end

  def update
    @wish = Wish.find(params[:id])
    if @wish.update(wish_params)
      redirect_to wishes_path
    else
      render :edit
    end
  end

  private

  def wish_params
    params.require(:wish).permit(:country_id, :budget, :invited)
  end
end
