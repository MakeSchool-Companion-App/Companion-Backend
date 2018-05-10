class User < ApplicationRecord
    has_many :attendances, dependent: :destroy
    validates :password, presence: false
    validates :email, presence:true, uniqueness: true
    validates :token, presence:false, uniqueness: true
    validates :first_name, presence:true, uniqueness: true
    validates :last_name, presence: true, uniqueness: true
    validates :image_url, presence: true, uniqueness: false
    validates :user_id, presence: false, uniqueness:false
    before_create :generate_token
    # Adding an attribute password
    attribute :password


  # Generates a token for a user
  def generate_token
    token_gen = SecureRandom.hex
    self.token = token_gen

    token_gen
  end


end
