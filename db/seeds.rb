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
  email: "juancho@gmail.com",
  password: 204_060
)

p "User #{user1.email} created"

user2 = User.create!(
  first_name: "jose",
  last_name: "perez",
  email: "jospe@gmail.com",
  password: 204_060
)

p "User #{user2.email} created"

3.times do
  file = URI.open('https://res.cloudinary.com/dryjnfxju/image/upload/v1664494779/Wilderness_Adventure_Camps_u5wj1e.jpg')
  camp = Camp.new(
    name: Faker::Restaurant.name,
    description: Faker::Restaurant.description,
    start_date: Faker::Date.between(from: Date.today, to: 2.days.from_now),
    end_date: Faker::Date.between(from: 8.days.from_now, to: 20.days.from_now + 1.days.from_now),
    location: Faker::Address.city,
    price: Faker::Number.between(from: 20, to: 100),
    capacity: Faker::Number.between(from: 2, to: 8),
    user: user1
  )
  camp.photos.attach(io: file, filename: 'camp.png', content_type: 'image/png')
  camp.save!
  p "#{camp.name} has been added to the DB."
end

p 'All records were created'
