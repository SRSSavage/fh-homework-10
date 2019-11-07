# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Player.destroy_all
Team.destroy_all
Game.destroy_all


positions = ['forward',
            'right back',
            'right midfielder',
            'defensive midfielder',
            'goalkeeper',
            'striker',
            'left midfielder',
            'defensive midfielder',
            'left back',
            'stopper',
            'sweeper']
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]

players = Player.all

100.times do 
  player = Player.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    age: Faker::Number.between(15, 30),
    position: positions.sample)
end

10.times do 
   Team.create(name: Faker::Team.name, away_team_id: numbers.sample, home_team_id: numbers)
end

team = Team.all


Team.all.each do |team|
  11.times do 
    team.players << players.sample
  end
end








# 10.times do 
#   game = team.games.players.create(away_team_id: :team_id, home_team_id: :team_id, name: Faker::WorldCup.team)
#   8.times do
#     team = game.players.teams.create(name: Faker::Team.name)
#     40.times do 
#       player = player.teams.games.create(
#         first_name: Faker::Name.first_name,
#         last_name: Faker::Name.last_name,
#         email: Faker::Internet.email,
#         age: Faker::Number.between(15, 30),
#         position: positions.sample)
#     end
#   end
# end


