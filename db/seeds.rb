# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p 'Deleting records...'
Camp.delete_all

10.times do
  camp = Camp.create!(
    title: Faker::Book.title,
    content: Faker::Quote.famous_last_words,
    price: rand(150..999),
    number_of_guests: rand(2..8),
    number_of_tents: rand(1..3)
  )
  p "#{camp.title} has been added to the DB."
end

p 'All records were created'
