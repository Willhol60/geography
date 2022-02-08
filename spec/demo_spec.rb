require "spec_helper"

class Dog
  def bark(obedient)
    if obedient == true
      "Woof"
    else
      "I will kill you"
    end
  end
end

RSpec.describe Dog do
  describe "#bark" do
    context "dog is obedient" do
      it "says 'Woof'" do
        dog = Dog.new

        expect(dog.bark(true)).to eq "Woof"
      end
    end

    context "dog is disobedient" do
      it "says 'I will kill you'" do
        dog = Dog.new

        expect(dog.bark(false)).to eq "I will kill you"
      end
    end
  end
end
