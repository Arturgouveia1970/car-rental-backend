class Car < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

  validates :model, :year, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

end
