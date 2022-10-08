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

User.create!(
  first_name: "juan",
  last_name: "perez",
  email: "juan@gmail.com",
  password: 204_060
)

p 'Creating users...'

def create_users
  10.times do
    user = User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: 204_060
    )
    p "#{user.first_name} has been added to the DB."
    create_camps(user)
  end
end

def create_camps(user)
  3.times do |i|
    file = File.open(Rails.root.join('app', 'assets', 'images', "camp#{rand(1..3)}.jpg"))
    camp = Camp.new(
      name: Faker::Restaurant.name,
      description: Faker::Restaurant.description[100..400],
      start_date: Faker::Date.between(from: Date.today, to: 2.days.from_now),
      end_date: Faker::Date.between(from: 15.days.from_now, to: 45.days.from_now),
      address: Faker::Address.country,
      price: Faker::Number.between(from: 2000, to: 10_000),
      capacity: Faker::Number.between(from: 2, to: 10),
      user:
    )
    camp.photos.attach(io: file, filename: "camp#{i}.jpg", content_type: 'image/jpg')
    camp.save!
    p "#{camp.name} has been added to the DB."

    3.times do
      Review.create!(
        content: Faker::Restaurant.review[0..79],
        rating: Faker::Number.between(from: 4, to: 5),
        camp:,
        user:
      )
    end
  end
end

create_users
p 'All records were created'
