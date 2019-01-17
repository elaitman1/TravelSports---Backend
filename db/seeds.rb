# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(username: "Matt", home_city: "Long Island")
g1 = Game.create(date: DateTime.new(), away_team: "76ers", home_team: "Knicks", city: "New York", arena: "MSG")
t1 = Trip.create(game_id: g1.id, user_id: u1.id, title: "The Knicks Stink", hotel: "Ritz-Carleton", transportation: "MegaBus")
e1 = Experience.create(trip_id: t1.id, img_url: 'https://thenypost.files.wordpress.com/2019/01/kevin-knox-2.jpg', review: "They Lost", rating: 3)
