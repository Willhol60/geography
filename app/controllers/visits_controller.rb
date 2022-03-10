class VisitsController < ApplicationController
  before_action :find_visit, only: [:edit, :update, :destroy]

  def index
    @visits = current_user.visits.latest
  end

  def new
    @visit = Visit.new
  end

  def create
    @visit = Visit.new(visit_params)
    @visit.user = current_user
    if @visit.save
      flash.notice = "One more trip added!"
      redirect_to visits_path
    else
      flash.alert = "Uh oh - didn't work"
      render :new
    end
  end

  def edit
  end

  def update
    if @visit.update(visit_params)
      redirect_to visits_path
    else
      flash.alert = "Uh oh - didn't work"
      render :edit
    end
  end

  def destroy
    @visit.destroy
    redirect_to visits_path
  end

  private

  def visit_params
    params.require(:visit).permit(:country_id, :date, :notes, :photo)
  end

  def find_visit
    @visit = Visit.find(params[:id])
  end
end
