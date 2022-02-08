require "rails_helper"

# let(:dog) { create(:visit) }

RSpec.describe Visit, type: :model do
  describe "associations" do
    it { should belong_to(:country) }
  end

  describe "validations" do
    # subject { build(:visit) }

    it { should validate_presence_of(:date) }

    it { should validate_presence_of(:notes) }
  end
end
