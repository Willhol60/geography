require 'pry'

class VisitsController < ApplicationController
  def index
    @visits = Visit.all
  end

  def new
    @visit = Visit.new
  end

  def create
    @visit = Visit.new(visit_params)
    if @visit.save!
      redirect_to visits_path
    else
      render flash
      render new
    end
  end

  def edit
    @visit = Visit.find(params[:id])
  end

  def update
    binding.pry
  end

  def destroy
  end

  private

  def visit_params
    params.require(:visit).permit(:country_id, :date, :notes, photos: [])
  end
end
