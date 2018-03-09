class User < ApplicationRecord
    has_many :attendances  
    validates :password, presence: false
    validates :email, presence:true, uniqueness: true
    # Adding an attribute password



  # Generates a token for a user
  def generate_token
    token_gen = SecureRandom.hex
    token_gen
  end


end
