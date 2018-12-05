require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    User.new(
      email: "peterpan@gmail.com",
      password: "neverland",
      image_url: "https://www.google.com",
      first_name: "Erick",
      last_name: "Sanchez",
      user_id: "999999"
    )
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    # This test is going to test if a user is trying to sign up without creating a email for themself
    it "is invalid without a email" do
      subject.email = nil

      expect(subject).to_not be_valid
    end

    it "requires a token after saving" do
      subject.save()

      expect(subject.token).to_not be_nil
    end

    it "will throw an error if no token is present when updating" do
      subject.save()

      subject.token = nil

      expect { subject.save!() }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "is invalid without a first_name" do
      subject.first_name = nil

      expect(subject).to_not be_valid
    end

    it "is invalid without a last_name" do
      subject.last_name = nil

      expect(subject).to_not be_valid
    end

    it "is invalid without a image_url" do
      subject.image_url = nil

      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it "users should have many attendances" do
      association = User.reflect_on_association(:attendances)

      expect(association.macro).to eq :has_many
    end

    it "users should have many beacons through attendances" do
      association = User.reflect_on_association(:beacons)

      expect(association.macro).to eq :has_many
    end
  end
end
