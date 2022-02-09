require "rails_helper"

RSpec.describe Wish, type: :model do
  describe "associations" do
    it { should belong_to(:country) }
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_numericality_of(:budget) }
  end
end
