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

user1 = User.create!(email: "test@test.fr", password: "password", pseudo: "Nour")
user2 = User.create!(email: "hola@test.fr ", password: "password", pseudo: "Zoe")
user3 = User.create!(email: "bye@test.fr  ", password: "password", pseudo: "Marc")


hotel1 = Hotel.create!(name: "Hotel de la plage", address: "1 rue de la plage")
puts "Hotel created"
hotel2 = Hotel.create!(name: "Hotel de la montagne", address: "1 rue de la montagne")
puts "Hotel created"
hotel3 = Hotel.create!(name: "Hotel de la ville", address: "1 rue de la ville")
puts "Hotel created"
hotel4 = Hotel.create!(name: "Hotel de la campagne", address: "1 rue de la campagne")
puts "Hotel created"
hotel5 = Hotel.create!(name: "Hotel de la foret", address: "1 rue de la foret")
puts "Hotel created"
hotel6 = Hotel.create!(name: "Hotel de la mer", address: "1 rue de la mer")
puts "Hotel created"
hotel7= Hotel.create!(name: "Hotel de la riviere", address: "1 rue de la riviere")
puts "Hotel created"
hotel8 = Hotel.create!(name: "Hotel de la montagne", address: "1 rue de la montagne")
puts "Hotel created"

puts "Room created"
room1 = Room.create!(hotel: hotel1, capacity: 2, price_per_night: 100)
puts "Room created"
room2 = Room.create!(hotel: hotel1, capacity: 4, price_per_night: 200)
puts "Room created"
room3 = Room.create!(hotel: hotel1, capacity: 6, price_per_night: 300)
puts "Room created"
room4 = Room.create!(hotel: hotel2, capacity: 2, price_per_night: 100)
puts "Room created"
room5 = Room.create!(hotel: hotel2, capacity: 4, price_per_night: 200)
puts "Room created"
room6 = Room.create!(hotel: hotel2, capacity: 6, price_per_night: 300)
puts "Room created"
room7 = Room.create!(hotel: hotel3, capacity: 2, price_per_night: 100)
puts "Room created"
room8 = Room.create!(hotel: hotel3, capacity: 4, price_per_night: 200)
puts "Room created"
room9 = Room.create!(hotel: hotel3, capacity: 6, price_per_night: 300)
puts "Room created"
room10 = Room.create!(hotel: hotel4, capacity: 2, price_per_night: 100)
puts "Room created"
room11 = Room.create!(hotel: hotel4, capacity: 4, price_per_night: 200)
puts "Room created"
room12 = Room.create!(hotel: hotel4, capacity: 6, price_per_night: 300)
puts "Room created"
room13 = Room.create!(hotel: hotel5, capacity: 2, price_per_night: 100)
puts "Room created"
room14 = Room.create!(hotel: hotel5, capacity: 4, price_per_night: 200)
puts "Room created"
room15 = Room.create!(hotel: hotel5, capacity: 6, price_per_night: 300)
puts "Room created"
room16 = Room.create!(hotel: hotel6, capacity: 2, price_per_night: 100)
puts "Room created"
room17 = Room.create!(hotel: hotel6, capacity: 4, price_per_night: 200)
puts "Room created"
room18 = Room.create!(hotel: hotel6, capacity: 6, price_per_night: 300)
puts "Room created"
room19 = Room.create!(hotel: hotel7, capacity: 2, price_per_night: 100)
puts "Room created"
room20 = Room.create!(hotel: hotel7, capacity: 4, price_per_night: 200)
puts "Room created"
room21 = Room.create!(hotel: hotel7, capacity: 6, price_per_night: 300)
puts "Room created"
room22 = Room.create!(hotel: hotel8, capacity: 2, price_per_night: 100)
puts "Room created"
room23 = Room.create!(hotel: hotel8, capacity: 4, price_per_night: 200)


puts "Booking created"

20.times do
  starts_at = Date.new(2024, 1, 1) + rand(365)
  ends_at = starts_at + rand(1..7)
  Booking.create!(user: User.all.sample, room: Room.all.sample, starts_at: starts_at, ends_at: ends_at)
end
