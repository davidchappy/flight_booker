class Flight < ApplicationRecord
  belongs_to  :destination, class_name: 'Airport'
  belongs_to  :origin, class_name: 'Airport'
  has_many    :bookings
  has_many    :passengers, through: :bookings
end
