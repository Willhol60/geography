require "rails_helper"

RSpec.describe PagesController, type: :request do
  describe "#play" do
    it "loads the play page" do
      get play_path(Country.last)
      expect(response).to render_template(:play)
    end
    it "assigns a random country" do
      get play_path
      expect(assigns(@country)).to eq(Country.all.sample)
    end
  end
end
