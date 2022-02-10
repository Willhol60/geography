require "pry"

class VisitsController < ApplicationController
  def index
    @visits = Visit.all.latest
  end

  def show
    @visit = Visit.find(params[:id])
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
    @visit = Visit.find(params[:id])
  end

  def update
    visit = Visit.find(params[:id])
    if visit.update(visit_params)
      redirect_to visits_path
    else
      flash.alert = "Uh oh - didn't work"
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
    params.require(:visit).permit(:country_id, :date, :notes, :photo)
  end
end
