class Car < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :model, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :image, presence: true
  validates :year, presence: true
end
