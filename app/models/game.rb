class Game < ApplicationRecord
  has_many :trips
  has_many :users, through: :trips

  def game_details
    home_team = Team.all.select {|t| t['id_team'] === self['home_team_id']}
    away_team = Team.all.select {|t| t['id_team'] === self['away_team_id']}

    stadium = {
      name: home_team.first.stadium_name,
      location: home_team.first.stadium_location,
      image: home_team.first.stadium_img
    }

    cleanedGame = {
      id: self.id,
      date: self.date.in_time_zone('Eastern Time (US & Canada)')
    }

    return {
      game: cleanedGame,
      home_team: home_team,
      away_team: away_team,
      stadium: stadium
    }
  end
end
