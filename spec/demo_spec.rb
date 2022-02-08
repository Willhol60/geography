require "spec_helper"

class Dog
  def bark(obedient)
    if obedient
      "Woof"
    else
      "I will kill you"
    end
  end

  def sit

  end
end

RSpec.describe Dog do
  let(:dog) { create(:visit) }

  describe "#bark" do
    context "dog is obedient" do
      it "says 'Woof'" do
        obedient = true

        expect(dog.bark(obedient)).to eq "Woof"
      end
    end

    context "dog is disobedient" do
      it "says 'I will kill you'" do
        obedient = false

        expect(dog.bark(obedient)).to eq "I will kill you"
      end
    end
  end
end
