class User < ApplicationRecord
    has_many :attendances, dependent: :destroy
    has_many :beacons, through: :attendances # Setting through relationship for complex queries

    validates :password, presence: false
    validates :email, presence: true, uniqueness: true
    validates :token, presence: false, uniqueness: true
    validates :first_name, presence: true, uniqueness: true
    validates :last_name, presence: true, uniqueness: true
    validates :image_url, presence: true, uniqueness: false
    validates :user_id, presence: false, uniqueness: false
    before_create :generate_token
    # Adding an attribute password
    attribute :password

    # Generates a token for a user
    def generate_token # Called before the create method for the user is called generates token for user
        token_gen = SecureRandom.hex
        self.token = token_gen

        token_gen
    end
end
