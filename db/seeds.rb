# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Game.destroy_all
Trip.destroy_all
Experience.destroy_all
Team.destroy_all


u1 = User.create(username: "Matt", home_city: "Long Island")
# g1 = Game.create(date: DateTime.new(), away_team: "76ers", home_team: "Knicks", city: "New York", arena: "MSG")
# t1 = Trip.create(game_id: g1.id, user_id: u1.id, title: "The Knicks Stink", hotel: "Ritz-Carleton", transportation: "MegaBus")
# e1 = Experience.create(trip_id: t1.id, img_url: 'https://thenypost.files.wordpress.com/2019/01/kevin-knox-2.jpg', review: "They Lost", rating: 3)


def get_games
  request = RestClient.get("https://www.thesportsdb.com/api/v1/json/1/eventsseason.php?id=4387&s=1819")
  response = JSON.parse(request)

  response.first.last.each do |game|
    dateEvent = game['dateEvent']
    dateArray = dateEvent.split("-").map{|d| d.to_i}

    strTime = game['strTime']
    timeArray = strTime.split(":").map{|t| t.to_i}

    cleanTime = DateTime.new(dateArray[0],dateArray[1],dateArray[2],timeArray[0],timeArray[1]).in_time_zone('Eastern Time (US & Canada)')

    Game.create(date: cleanTime, away_team_id: game['idAwayTeam'], home_team_id: game['idHomeTeam'])
  end
end

get_games


def get_teams
  request = RestClient.get("https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id=4387")
  response = JSON.parse(request)

  response.first.last.each do |team|
    Team.create(name: team['strTeam'],
                id_team: team['idTeam'],
                stadium_img: team['strStadiumThumb'],
                stadium_name: team['strStadium'],
                stadium_location: team['strStadiumLocation'],
                website: team['strWebsite'],
                logo: team['strTeamBadge'])
  end
end

get_teams
