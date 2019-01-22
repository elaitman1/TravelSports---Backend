class Experience < ApplicationRecord
  belongs_to :trip

  def add_game_id
    {
      trip_id: self.trip_id,
      img_url: self.img_url,
      review: self.review,
      rating: self.rating,
      game_id: self.trip.game.id
    }
  end
end
