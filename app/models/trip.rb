class Trip < ApplicationRecord
  belongs_to :game
  belongs_to :user
  belongs_to :hotel
  belongs_to :transportation
  has_one :experience
end
