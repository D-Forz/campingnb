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

20.times do |i|
  randit = rand(1..3)
  file = File.open(Rails.root.join('app', 'assets', 'images', "camp#{randit}.jpg"))
  camp = Camp.new(
    name: Faker::Restaurant.name,
    description: Faker::Restaurant.description,
    start_date: Faker::Date.between(from: Date.today, to: 2.days.from_now),
    end_date: Faker::Date.between(from: 8.days.from_now, to: 20.days.from_now + 1.days.from_now),
    location: Faker::Address.city,
    price: Faker::Number.between(from: 20, to: 100),
    capacity: Faker::Number.between(from: 2, to: 8),
    user: [user1, user2].sample
  )
  camp.photos.attach(io: file, filename: "camp#{i}.jpg", content_type: 'image/jpg')
  camp.save!
  p "#{camp.name} has been added to the DB."

  2.times do
    review = Review.new(
      rating: Faker::Number.between(from: 1, to: 5),
      content: "This is a great campsite. I would definitely recommend it to anyone.",
      camp: camp,
      user: [user1, user2].sample
    )
    review.save!
  end
end

p 'All records were created'
