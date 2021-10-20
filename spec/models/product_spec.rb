require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context "if all field are present" do
      it "should be valid" do
        expect(Product.new(name: "Socks", price: 1000, quantity: 10, category_id: 1)).to_not be_valid
      end
    end
    context "should contain name" do
      it "is not valid without a name" do
        expect(Product.new(name: nil, price: 1000, quantity: 10, category_id: 1)).to_not be_valid
      end
    end
    context "should contain price" do
      it "is not valid without a price" do
        expect(Product.new(name: "Socks", price: nil, quantity: 10, category_id: 1)).to_not be_valid
      end
    end
    context "should contain quantity" do
      it "is not valid without a quantity" do
        expect(Product.new(name: "Socks", price: 1000, quantity: nil, category_id: 1)).to_not be_valid
      end
    end
    context "should contain category" do
      it "is not valid without a category" do
        expect(Product.new(name: "Socks", price: 1000, quantity: 10, category_id: nil)).to_not be_valid
      end
    end
  end
end
