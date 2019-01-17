class Trip < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_one :experience
end
