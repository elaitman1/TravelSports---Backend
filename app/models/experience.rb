class Experience < ApplicationRecord
  belongs_to :trip

  def self.add_game_ids
    self.all.map do |exp|
      {
        trip_id: exp.trip_id,
        img_url: exp.img_url,
        review: exp.review,
        rating: exp.rating,
        game_id: exp.trip.game.id
      }
    end
  end

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
