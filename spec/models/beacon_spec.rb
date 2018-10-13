require 'rails_helper'

RSpec.describe Beacon, type: :model do

    subject {
      Beacon.new(
        hardware_id: "5432",
        title: "Golden Gate"
      )
    }

    describe "Validations" do
      it "should contain all required properties" do
        beacon = Beacon.new(
          hardware_id: "5432",
          title: "Golden Gate"
        )

        expect(beacon).to be_valid
      end

      it "should be invalid if hardware_id is missing" do
        bad_beacon = Beacon.new(
          title: "Golden Gate"
        )

        expect(bad_beacon).to_not be_valid
      end

      it "should be invalid if title is missing" do
        bad_beacon = Beacon.new(
          hardware_id: "5432"
        )

        expect(bad_beacon).to_not be_valid
      end

      it "should be invalid if all properties are missing" do
        bad_beacon = Beacon.new()

        expect(bad_beacon).to_not be_valid
      end
    end

    # TODO: Pass these tests
    describe "Associations" do
      it "has many attendances" do
        assc = Beacon.reflect_on_association(:attendance)
        expect(assc.macro).to eq :has_many
      end

      it "has many users" do
        assc = Beacon.reflect_on_association(:user)
        expect(assc.macro).to eq :has_many
      end
    end

end
