class Reservation < ApplicationRecord
  belongs_to :user_id
  belongs_to :car_id
end
