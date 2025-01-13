# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

GENRES = [
  'action',
  'thriller',
  'comedy',
  'horror',
  'romance',
  'western',
  'science fiction'
].freeze

10.times do
  User.create(
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.unique.phone_number
  )
end

50.times { Movie.create(title: Faker::Movie.unique.title, genre: GENRES.sample) }

5.times do
  Rental.create(user_id: User.all.sample.id, movie_id: Movie.all.sample.id)
end
