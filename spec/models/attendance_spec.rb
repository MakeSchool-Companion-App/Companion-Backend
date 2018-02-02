require 'rails_helper'

RSpec.describe Attendance, type: :model do
  subject {
      User.new(id: nil, email: "matthewharrilal@gmail.com", password: "matthewharrilal", created_at: nil, updated_at: nil)
  }
  describe "Validations" do 
    # it "must have in time and associated with user id" do
     
    #   attendance 
    #   expect(attendance).to be_valid
    # end 

    it "has in time and no associated user id" do 
      # We are testing for if the user has passed the only requeired parameter and did not associate the attendance with the user id
      attendance = Attendance.new(name: nil, in_time: "1:35pm", out_time:nil, created_at:nil, updated_at: nil, user_id: nil)
      expect(attendance).to_not be_valid
    end 
  end
end
