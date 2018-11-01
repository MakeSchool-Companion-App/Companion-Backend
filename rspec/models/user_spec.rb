require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do 
    it "is valid with valid attributes" do
    user = User.new(email: "peterpan@gmail.com", password: "neverland")
    expect(user).to be_valid
    end

    # This test is going to test if a user is trying to sign up without creating a email for themself
    it "is invalid without a email" do 
    user = User.new(email:nil, password: "Oop")
    expect(user).to_not be_valid
    end

    it "is invalid without a password" do 
      user = User.new(email: "jadestone@gmail.com", password: nil)
      expect(user).to_not be_valid
    end

    it "is invalid without email and password" do 
      user = User.new(email:nil, password:nil)
      expect(user).to_not be_valid
    end

  describe "Associations" do 
    it "users should have many days of attendances" do 
      association = User.reflect_on_association(:attendance)
      expect(association.macro).to eq :has_many
  end

end

  end
end


