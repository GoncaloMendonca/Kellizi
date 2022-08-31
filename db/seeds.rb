# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# Company.destroy_all
# User.destroy_all

puts 'Creating 5 fake users...'
1.times do |x|
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 6)
  )
  puts "User #{x} created."
end

users = User.all

2.times do
  Company.create!(
    name: Faker::Company.name,
    country: Faker::Dessert.variety
  )

  puts "Company created."
end

Company.all.each do |company|
  2.times do
    product = Product.new(
      name: Faker::Company.name,
      category: Faker::Dessert.variety,
      company:
    )

    product.save!

    puts "Product created."

    Contract.create!(
      price: rand(1..100),
      source: [0, 1].sample,
      starts_at: "2021-07-30",
      ends_at: "2022-07-30",
      active: [true, false].sample,
      product:,
      user: users.sample,
      company:
    )
  end
end

puts 'Finished!'
