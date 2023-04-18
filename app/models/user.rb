class User < ApplicationRecord
  
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable,
         

  has_secure_password

  validates :email, presence: true, uniqueness: true

  has_many :cars
  has_many :reservations
end
