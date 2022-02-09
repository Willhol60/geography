require "rails_helper"

# let(:dog) { create(:visit) }

RSpec.describe Visit, type: :model do
  describe "associations" do
    it { should belong_to(:country) }
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:notes) }
    it { should validate_length_of(:notes).is_at_most(30) }
  end

  describe ".latest" do
    it "changes the order of the visits list" do
      expect(Visit.all).not_to eq Visit.latest.all
    end

    it "sorts all visits by date order ascending" do
      expect(Visit.all.sort_by(&:date)).to eq Visit.latest.all
    end
  end
end
