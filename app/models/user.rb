class User < ApplicationRecord
    has_many :attendances  
    validates :password, presence: true
    validates :email, presence:true, uniqueness: true
    # Adding an attribute password
    attribute :password, :string

    # Before we save the user we want to encrypt password
    before_save :encrypt_password

    # Before we create the user we generate the token
    before_create :generate_token

    def self.authenticate(email, password)
        '''Authenticates a user through email and password using bcrypt hashing'''
        user = self.find_by_email(email)
        puts(email)
        if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
          user
        else
          nil
        end
      end
      
      # Encrypts a password
      def encrypt_password 
        if password.present?
          self.password_salt = BCrypt::Engine.generate_salt
          self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        end
      end
      
      # Generates a token for a user
      def generate_token
        token_gen = SecureRandom.hex
        self.token = token_gen
        token_gen
      end
end
