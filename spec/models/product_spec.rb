require 'rails_helper'

RSpec.describe Product, type: :model do
  subject {
    Product.new(name: "Socks", price_cents: 1000, quantity: 10, category_id: 1)
  }
  describe 'Validations' do
    context "if all field are present" do
      it "should be valid" do
        expect(subject).to be_valid
      end
    end
    context "should contain name" do
      it "is not valid without a name" do
        subject.name = nil
        expect(subject).to_not be_valid
      end
    end
    context "should contain price" do
      it "is not valid without a price" do
        subject.price_cents = nil
        expect(subject).to_not be_valid
      end
    end
    context "should contain quantity" do
      it "is not valid without a quantity" do
        subject.quantity = nil
        expect(subject).to_not be_valid
      end
    end
    context "should contain category" do
      it "is not valid without a category" do
        subject.category = nil
        expect(subject).to_not be_valid
      end
    end
  end
end
