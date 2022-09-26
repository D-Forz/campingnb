# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p 'Deleting records...'
Camp.delete_all

user = User.create!(
  first_name: "juan",
  last_name: "perez",
  owner: false,
  email: "juancho@gmail.com",
  password: 204_060
)

15.times do
  camp = Camp.create!(
    title: (0...8).map { (65 + rand(26)).chr }.join,
    content: Faker::Quote.famous_last_words,
    price: rand(150..999),
    number_of_guests: rand(2..8),
    number_of_tents: rand(1..3),
    user_id: user.id
  )
  p "#{camp.title} has been added to the DB."
end

1.upto 10 do |i|
  Booking.create!(
    camp_id: i + 1,
    user_id: 1,
    start_date: Date.parse('2022-09-25'),
    end_date: Date.parse('2022-09-28')
  )
end

p 'All records were created'
