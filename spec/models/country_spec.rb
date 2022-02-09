require "rails_helper"

RSpec.describe Country, type: :model do
  describe "associations" do
    it { should have_many(:wishes).dependent(:destroy) }
    it { should have_many(:visits).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:flag) }
    it { should validate_presence_of(:population) }
    it { should validate_presence_of(:capital) }
    it { should validate_numericality_of(:population) }
  end
end
