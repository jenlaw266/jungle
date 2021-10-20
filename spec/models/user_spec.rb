require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject {
      User.new(first_name: "Jane", last_name: "Doe", email: "jane@email.com", password: "secret", password_confirmation: "secret")
    }
    context "if all required fields are filled" do
      it "should be valid" do
        expect(subject).to be_valid
      end
    end
    context "if password and password_confirmation does not match" do
      it "should not be valid" do
        subject.password_confirmation = "wrong"
        expect(subject).to_not be_valid
      end
    end
    context "email must be unique" do
      before { User.create!(first_name: "John", last_name: "Doe", email: "Jane@email.com", password: "secret", password_confirmation: "secret") }
      it "should not be valid" do
        expect(subject).to_not be_valid
      end
    end
    context "if email is missing" do
      it "should not be valid" do
        subject.email = nil
        expect(subject).to_not be_valid
      end
    end
    context "if first_name is missing" do
      it "should not be valid" do
        subject.first_name = nil
        expect(subject).to_not be_valid
      end
    end
    context "if last_name is missing" do
      it "should not be valid" do
        subject.last_name = nil
        expect(subject).to_not be_valid
      end
    end
    context "if password is less than minimum length" do
      it "should not be valid" do
        subject.password = "a"
        subject.password_confirmation = "a"
        expect(subject).to_not be_valid
      end
    end
  end
  describe '.authenticate_with_credentials' do
    before { User.create!(first_name: "John", last_name: "Doe", email: "john@email.com", password: "secret", password_confirmation: "secret") }
    context "edge case: space before/after email" do
      it "should be valid" do
        subject.email = " john@email.com "
        expect(subject).to be_valid
      end
    end
    context "edge case: email case sensitive == false" do
      it "should be valid" do
        subject.email = "JohN@email.coM"
        expect(subject).to be_valid
      end
    end
  end
end

