# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'mini_magick'
require 'cloudinary'

User.destroy_all
Hotel.destroy_all

hotel_images = ["hotel1.jpg", "hotel2.jpg", "hotel3.jpg", "hotel4.jpg", "hotel5.jpg", "hotel6.jpg", "hotel7.jpg", "hotel8.jpg", "hotel9.jpg", "hotel10.jpg"]
chambre_images = ["chambre1.jpg", "chambre2.jpg", "chambre3.jpg", "chambre4.jpg", "chambre5.jpg", "chambre6.jpg", "chambre7.jpg", "chambre8.jpg", "chambre9.jpg", "chambre10.jpg"]

user1 = User.create!(email: "nour@mail.com", password: "test123", pseudo: "bnoure")
avatar1 = Cloudinary::Uploader.upload(Rails.root.join('app', 'assets', 'images', 'av1.jpg'))
user1.avatar.attach(io: URI.open(avatar1['url']), filename: 'av1.jpg', content_type: 'image/png')

user2 = User.create!(email: "zoe@mail.com", password: "test123", pseudo: "zoe")
avatar2 = Cloudinary::Uploader.upload(Rails.root.join('app', 'assets', 'images', 'av2.jpg'))
user2.avatar.attach(io: URI.open(avatar2['url']), filename: 'av2.jpg', content_type: 'image/png')

user3 = User.create!(email: "marc@mail.com", password: "test123", pseudo: "marc")
avatar3 = Cloudinary::Uploader.upload(Rails.root.join('app', 'assets', 'images', 'av3.jpg'))
user3.avatar.attach(io: URI.open(avatar3['url']), filename: 'av3.jpg', content_type: 'image/png')

# Tableau de noms d'hôtels aléatoires
hotel_names = ["Hotel de la plage", "Hotel du soleil", "Hotel des voyageurs", "Hotel de la gare", "Hotel de la paix", "Hotel du commerce", "Hotel de l'europe", "Hotel de la poste", "Hotel du chateau", "Hotel de la fontaine"]

# Tableau de noms de rues aléatoires
street_names = ["rue de la Liberté", "avenue des Champs-Élysées", "boulevard Haussmann", "rue du Faubourg Saint-Honoré", "avenue Montaigne", "rue de Rivoli", "boulevard Saint-Germain", "rue de la République", "avenue Foch", "boulevard des Capucines"]

# Tableau de villes en France
cities = ["Paris", "Marseille", "Lyon", "Toulouse", "Nice", "Nantes", "Strasbourg", "Montpellier", "Bordeaux", "Lille"]

# Hash pour suivre le nombre d'hôtels par ville
hotel_counts = Hash.new(0)


# Nombre d'hôtels que vous souhaitez créer
number_of_hotels = 200

number_of_hotels.times do
  # Je souhaite savoir a combien de suis rendu
  puts "Nombre d'hotels créés : #{Hotel.count}"
  hotel_name = hotel_names.sample
  street_name = street_names.sample
  city = cities.sample
  address_number = rand(1..100)  # Numéro d'adresse aléatoire entre 1 et 100
  address = "#{address_number} #{street_name}"
  number_of_rooms = rand(1..3)  # Nombre aléatoire de chambres entre 1 et 3

  # Vérifier si le nombre maximum d'hôtels par ville est atteint
  if hotel_counts[city] < 10
    # Créer l'hôtel
    hotel = Hotel.create!(
      name: hotel_name,
      address: address,
      city: city
    )

    # Incrémenter le nombre d'hôtels pour cette ville
    hotel_counts[city] += 1


    # Attacher une image d'hôtel aléatoire
    hotel_image = Cloudinary::Uploader.upload(Rails.root.join('app', 'assets', 'images', hotel_images.sample))
    hotel.image.attach(io: URI.open(hotel_image['url']), filename: 'hotel.jpg', content_type: 'image/jpg')
    puts "Hôtel créé : #{hotel.name}, #{hotel.address}, #{hotel.city}"

    # Créer les chambres pour l'hôtel
    number_of_rooms.times do |i|
      room_name = "Chambre #{i+1}"
      capacity = rand(1..8)  # Capacité aléatoire entre 1 et 6
      price_per_night = rand(10..150)  # Prix aléatoire entre 10 et 150

      # Créer la chambre
      room = Room.create!(
        hotel: hotel,
        name: room_name,
        capacity: capacity,
        price_per_night: price_per_night
      )

      # Attacher une image de chambre aléatoire
      room_image = Cloudinary::Uploader.upload(Rails.root.join('app', 'assets', 'images', chambre_images.sample))
      room.image.attach(io: URI.open(room_image['url']), filename: 'chambre.jpg', content_type: 'image/jpg')
      puts "Chambre créée : #{room.name}, Capacité : #{room.capacity}, Prix par nuit : #{room.price_per_night}"
    end
  end
end

20.times do
  starts_at = Date.new(2024, 1, 1) + rand(365)
  ends_at = starts_at + rand(1..7)
  Booking.create!(user: User.all.sample, room: Room.all.sample, starts_at: starts_at, ends_at: ends_at)
end
