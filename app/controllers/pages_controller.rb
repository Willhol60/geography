class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :play ]

  def play
    @country = Country.all.sample
  end
end
