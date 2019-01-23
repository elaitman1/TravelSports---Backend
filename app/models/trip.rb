class Trip < ApplicationRecord
  belongs_to :game
  belongs_to :user
  belongs_to :hotel
  belongs_to :transportation
  has_one :experience

  def self.trips_and_games

    self.all.map do |trip|
      
       {
        trip: trip,
        game: trip.game
      }
    end
  end

  def details
    {
      trip: self,
      hotel: self.hotel.name,
      game: self.game,
      transportation: self.transportation.name
    }
  end
end
