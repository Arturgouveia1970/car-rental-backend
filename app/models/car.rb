class Car < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  validates :model, presence: true
  validates :year, presence: true
  validates :image, presence: true
  validates :price, presence: true
end
