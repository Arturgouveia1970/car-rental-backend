class User < ApplicationRecord
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  # has_secure_password

  # validates :email, presence: true, uniqueness: true

  has_many :cars
  has_many :reservations

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true
  # validates :password, presence: true, length: { maximum: 20 }
end
