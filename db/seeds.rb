# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Hotel.destroy_all

user1 = User.create!(email: "nour@mail.com", password: "test123", pseudo: "bnoure")
user1.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'av1.jpg')), filename: 'av1.jpg', content_type: 'image/png')

user2 = User.create!(email: "zoe@mail.com", password: "test123", pseudo: "zoe")
user2.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'av2.jpg')), filename: 'av2.jpg', content_type: 'image/png')

user3 = User.create!(email: "marc@mail.com", password: "test123", pseudo: "marc")
user3.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'av3.jpg')), filename: 'av3.jpg', content_type: 'image/png')


hotel1 = Hotel.create!(name: "Hotel de la plage", address: "1 rue de la plage", city: "Bordeaux")
puts "Hotel created"
hotel2 = Hotel.create!(name: "Hotel de la montagne", address: "1 rue de la montagne", city: "Lyon")
puts "Hotel created"
hotel3 = Hotel.create!(name: "Hotel de la ville", address: "1 rue de la ville", city: "Paris")
puts "Hotel created"
hotel4 = Hotel.create!(name: "Hotel de la campagne", address: "1 rue de la campagne", city: "Toulouse")
puts "Hotel created"
hotel5 = Hotel.create!(name: "Hotel de la foret", address: "1 rue de la foret", city: "Bordeaux")
puts "Hotel created"
hotel6 = Hotel.create!(name: "Hotel de la mer", address: "1 rue de la mer", city: "Lyon")
puts "Hotel created"
hotel7= Hotel.create!(name: "Hotel de la riviere", address: "1 rue de la riviere", city: "Paris")
puts "Hotel created"
hotel8 = Hotel.create!(name: "Hotel de la montagne", address: "1 rue de la montagne", city: "Toulouse")
puts "Hotel created"

puts "Room created"
room1 = Room.create!(hotel: hotel1, name: "Room 1", capacity: 2, price_per_night: 100)
puts "Room created"
room2 = Room.create!(hotel: hotel1, name: "Room 2", capacity: 4, price_per_night: 200)
puts "Room created"
room3 = Room.create!(hotel: hotel1, name: "Room 3", capacity: 6, price_per_night: 300)
puts "Room created"
room4 = Room.create!(hotel: hotel2, name: "Room 4", capacity: 2, price_per_night: 100)
puts "Room created"
room5 = Room.create!(hotel: hotel2, name: "Room 5", capacity: 4, price_per_night: 200)
puts "Room created"
room6 = Room.create!(hotel: hotel2, name: "Room 6", capacity: 6, price_per_night: 300)
puts "Room created"
room7 = Room.create!(hotel: hotel3, name: "Room 7", capacity: 2, price_per_night: 100)
puts "Room created"
room8 = Room.create!(hotel: hotel3, name: "Room 8", capacity: 4, price_per_night: 200)
puts "Room created"
room9 = Room.create!(hotel: hotel3, name: "Room 9", capacity: 6, price_per_night: 300)
puts "Room created"
room10 = Room.create!(hotel: hotel4, name: "Room 10", capacity: 2, price_per_night: 100)
puts "Room created"
room11 = Room.create!(hotel: hotel4, name: "Room 11", capacity: 4, price_per_night: 200)
puts "Room created"
room12 = Room.create!(hotel: hotel4, name: "Room 12", capacity: 6, price_per_night: 300)
puts "Room created"
room13 = Room.create!(hotel: hotel5, name: "Room 13", capacity: 2, price_per_night: 100)
puts "Room created"
room14 = Room.create!(hotel: hotel5, name: "Room 14", capacity: 4, price_per_night: 200)
puts "Room created"
room15 = Room.create!(hotel: hotel5, name: "Room 15", capacity: 6, price_per_night: 300)
puts "Room created"
room16 = Room.create!(hotel: hotel6, name: "Room 16", capacity: 2, price_per_night: 100)
puts "Room created"
room17 = Room.create!(hotel: hotel6, name: "Room 17", capacity: 4, price_per_night: 200)
puts "Room created"
room18 = Room.create!(hotel: hotel6, name: "Room 18", capacity: 6, price_per_night: 300)
puts "Room created"
room19 = Room.create!(hotel: hotel7, name: "Room 19", capacity: 2, price_per_night: 100)
puts "Room created"
room20 = Room.create!(hotel: hotel7, name: "Room 20", capacity: 4, price_per_night: 200)
puts "Room created"
room21 = Room.create!(hotel: hotel7, name: "Room 21", capacity: 6, price_per_night: 300)
puts "Room created"
room22 = Room.create!(hotel: hotel8, name: "Room 22", capacity: 2, price_per_night: 100)
puts "Room created"
room23 = Room.create!(hotel: hotel8, name: "Room 23", capacity: 8, price_per_night: 200)


puts "Booking created"

20.times do
  starts_at = Date.new(2024, 1, 1) + rand(365)
  ends_at = starts_at + rand(1..7)
  Booking.create!(user: User.all.sample, room: Room.all.sample, starts_at: starts_at, ends_at: ends_at)
end
