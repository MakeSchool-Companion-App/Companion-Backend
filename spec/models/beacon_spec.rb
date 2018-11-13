require 'rails_helper'

RSpec.describe Beacon, type: :model do
  subject {
    Beacon.new(hardware_id: "1245_dfwfe", title: "Hallway")
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a hardware_id" do
    subject.hardware_id = nil

    expect(subject).to_not be_valid
  end

  it "is not valid without a title" do
    subject.title = nil

    expect(subject).to_not be_valid
  end
end
