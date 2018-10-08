require 'minitest/autorun'

class UserRegistrationTest < Minitest::Test
    def setup do
        @user = User.new(email: "test@gmail.com", image_url: "test_url" , first_name: "John Doe", last_name: "Doe John", user_id: 1)
    end

    
end
