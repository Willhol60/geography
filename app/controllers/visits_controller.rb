class VisitsController < ApplicationController
  def index
    @visits = Visit.all
  end

  def new
    @visit = Visit.new
  end

  def create
    @visit = Visit.new(visit_params)
    if @visit.save
      redirect_to visits_path
    else
      render flash
      render new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def visit_params
    params.require(:visit).permit(:country_id, :date, :notes)
  end
end
