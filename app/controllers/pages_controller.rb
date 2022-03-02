class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :play ]

  def play
    count = Country.count
    random_offset = rand(count)
    @country = Country.offset(random_offset).first
    # @country = Country.all.sample
  end
end
