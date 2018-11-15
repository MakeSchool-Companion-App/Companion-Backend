# This will guess the User class
FactoryBot.define do
	factory :user do
		email { "peterpan@gmail.com" }
		password { "neverland" }
		token { "thisIsAValidToken" }
		image_url { "https://www.google.com" }
		first_name { "Erick" }
		last_name { "Sanchez" }
		user_id { "999999" }
	end
end