require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject {
      User.new(first_name: "Jane", last_name: "Doe", email: "jane@email.com", password: "secret", password_confirmation: "secret")
    }
    context "creating a new user" do
      it "should be valid if all required fields are filled" do
        expect(subject).to be_valid
      end
      it "should not be valid if password and password_confirmation does not match" do
        subject.password_confirmation = "wrong"
        expect(subject).to_not be_valid
      end
      it "should not be valid if email is missing" do
        subject.email = nil
        expect(subject).to_not be_valid
      end
      it "should not be valid if first_name is missing" do
        subject.first_name = nil
        expect(subject).to_not be_valid
      end
      it "should not be valid if last_name is missing" do
        subject.last_name = nil
        expect(subject).to_not be_valid
      end
      it "should not be valid if password is less than minimum length" do
        subject.password = "a"
        subject.password_confirmation = "a"
        expect(subject).to_not be_valid
      end
      context "creating a new user with exsiting email" do
        before { User.create!(first_name: "John", last_name: "Doe", email: "Jane@email.com", password: "secret", password_confirmation: "secret") }
        it "should not be valid if email is not unique" do
          expect(subject).to_not be_valid
        end
      end
    end
  end
  describe '.authenticate_with_credentials' do
    before { User.create!(first_name: "John", last_name: "Doe", email: "John@email.com", password: "secret", password_confirmation: "secret") }
    context "login" do
      it "should be user" do
        user = User.authenticate_with_credentials('john@email.com', "secret")
        expect(user.email).to eq('john@email.com')
        expect(user.first_name).to eq('John')
        expect(user.last_name).to eq('Doe')
      end
      it "should not be able to login" do
        user = User.authenticate_with_credentials('j@email.com', "secret")
        expect(user).to eq(nil)
      end
      it "should be valid with edge case: space before/after email" do
        user = User.authenticate_with_credentials(' john@email.com ', "secret")
        expect(user.email).to eq('john@email.com')
      end
      it "should be valid with edge case: email case sensitive == false" do
        user = User.authenticate_with_credentials('johN@email.coM', "secret")
        expect(user.email).to eq('john@email.com')
      end
    end

  end
end

