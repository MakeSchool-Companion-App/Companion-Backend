class User < ApplicationRecord
    has_many :attendance  
    validates :password, presence: true
    validates :email, presence:true, uniqueness: true
end
