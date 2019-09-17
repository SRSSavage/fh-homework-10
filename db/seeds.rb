# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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


50.times do 
  Player.create([{
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    age: Faker::Number.between(15, 30)
  }])
end