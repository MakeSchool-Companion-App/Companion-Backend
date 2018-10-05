class Attendance < ApplicationRecord
    # In our migration file are the attributes for the attendance class which are the name of the user as well as
    # the in time and the out time
    belongs_to :user
    belongs_to :beacon
    validates :event, :event_time, presence:true
    validates :beacon_id, presence: true
    validates :user_id, presence:true
end
