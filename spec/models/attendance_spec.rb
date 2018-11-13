require 'rails_helper'

RSpec.describe Attendance, type: :model do
  let(:user) { User.new(id: 1, email: "matthewharrilal@gmail.com", password: "matthewharrilal", created_at: nil, updated_at: nil) }

  let(:beacon) { Beacon.new(hardware_id: "1245_dfwfe", title: "Hallway") }

  subject {
    Attendance.new(event_in: "12pm", event_out: "4pm", beacon: beacon, user: user)
  }

  describe "Validations" do
    it "is valid with all attributes" do
      expect(subject).to be_valid
    end

    it "is invalid without event_in" do
      subject.event_in = nil

      expect(subject).to_not be_valid
    end

    it "is valid without event_out" do
      subject.event_out = nil

      expect(subject).to be_valid
    end

    it "is valid without beacon" do
      subject.beacon_id = nil

      expect(subject).to_not be_valid
    end

    it "is valid without user" do
      subject.user_id = nil

      expect(subject).to_not be_valid
    end
  end
end
