require 'rails_helper'

RSpec.describe Product, type: :model do
  subject {
    Product.new(name: "Socks", price_cents: 1000, quantity: 10, category_id: 1)
  }
  describe 'Validations' do
    context "adding a new product" do
      it "is valid if all field are present" do
        expect(subject).to be_valid
      end
      it "is not valid without a name" do
        subject.name = nil
        expect(subject).to_not be_valid
      end
      it "is not valid without a price" do
        subject.price_cents = nil
        expect(subject).to_not be_valid
      end
      it "is not valid without a quantity" do
        subject.quantity = nil
        expect(subject).to_not be_valid
      end
      it "is not valid without a category" do
        subject.category = nil
        expect(subject).to_not be_valid
      end
    end
  end
end
