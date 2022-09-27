# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p 'Deleting records...'
Camp.delete_all
User.delete_all

user = User.create!(
  first_name: "juan",
  last_name: "perez",
  owner: false,
  email: "juancho@gmail.com",
  password: 204_060
)

15.times do
  camp = Camp.create!(
    name: Faker::Games::Pokemon.name,
    description: Faker::Games::Pokemon.move,
    start_date: Faker::Date.between(from: 7.days.ago, to: 2.days.from_now),
    end_date: Faker::Date.between(from: 6.days.ago, to: 9.days.from_now),
    location: Faker::Games::Pokemon.location,
    price: Faker::Number.between(from: 20, to: 100),
    capacity: Faker::Number.between(from: 2, to: 8),
    user: user
  )
  p "#{camp.name} has been added to the DB."
end

1.upto 10 do |i|
  Booking.create!(
    camp_id: i + 1,
    user_id: 1,
    start_date: Date.parse('2022-09-25'),
    end_date: Date.parse('2022-09-28')
  )
end

Review.create!(
  rating: 5,
  content: "This was a great camp!",
  booking_id: 1
)

p 'All records were created'
