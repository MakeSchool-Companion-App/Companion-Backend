# This will guess the User class
FactoryBot.define do
	factory :authenticated_user, class: User do
		email { "peterpan@gmail.com" }
		password { "neverland" }
		image_url { "https://www.google.com" }
		first_name { "Erick" }
		last_name { "Sanchez" }
		user_id { "999999" }
	end
end