# This will guess the User class
FactoryBot.define do
	factory :user, class: User do
		email { "peterpan@gmail.com" }
		password { "neverland" }
		image_url { "https://www.google.com" }
		first_name { "Erick" }
		last_name { "Sanchez" }
		user_id { "999999" }
	end

	factory :beacon do
		hardware_id { "1245_dfwfe" } 
		title { "Hallway" }
	end

	factory :beacon_invalid, class: Beacon do
	end

	factory :attendance do
		event_in { "12pm"  }
		event_out { "4pm"  }
		event { "Welcome"  }
		association :beacon, factory: :beacon
		association :user, factory: :user
	end

	factory :attendance_without_associations, class: Attendance do
		event_in { "12pm"  }
		event_out { "4pm"  }
		event { "Welcome"  }
	end

	factory :attendance_invalid, class: Attendance do
	end
end