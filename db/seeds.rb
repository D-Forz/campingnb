# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p 'Deleting records...'
User.delete_all
Camp.delete_all
Booking.delete_all

user1 = User.create!(
  first_name: "juan",
  last_name: "perez",
  owner: false,
  email: "juancho@gmail.com",
  password: 204_060
)

p "User #{user1.email} created"

user2 = User.create!(
  first_name: "jose",
  last_name: "perez",
  owner: false,
  email: "jospe@gmail.com",
  password: 204_060
)

p "User #{user2.email} created"

10.times do
  file = URI.open('https://res.cloudinary.com/dryjnfxju/image/upload/v1664494779/Wilderness_Adventure_Camps_u5wj1e.jpg')
  camp = Camp.create!(
    name: Faker::Restaurant.name,
    description: Faker::Restaurant.description,
    start_date: Faker::Date.between(from: 7.days.ago, to: 2.days.from_now),
    end_date: Faker::Date.between(from: 6.days.ago, to: 9.days.from_now),
    location: Faker::Address.city,
    price: Faker::Number.between(from: 20, to: 100),
    capacity: Faker::Number.between(from: 2, to: 8),
    user: user1
  )
  camp.photos.attach(io: file, filename: 'camp.png', content_type: 'image/png')
  p "#{camp.name} has been added to the DB."
end

0.upto 5 do |i|
  Booking.create!(
    camp_id: i + 1,
    user_id: user1.id,
    start_date: Date.parse('2022-09-25'),
    end_date: Date.parse('2022-09-28')
  )
end

Review.create!(
  rating: 5,
  content: "This was a great camp!",
  camp_id: 1
)

p 'All records were created'
