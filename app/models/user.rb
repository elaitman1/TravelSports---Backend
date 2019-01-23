class User < ApplicationRecord
  has_many :trips
  has_many :games, through: :trips

  has_secure_password


end
