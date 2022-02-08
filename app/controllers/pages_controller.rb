class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :play ]

  # callback method for winning the game

  def home
  end

  def play
    @country = Country.all.sample
  end
end
