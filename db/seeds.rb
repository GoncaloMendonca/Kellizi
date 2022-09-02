# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Contract.destroy_all
Company.destroy_all
User.destroy_all
Category.destroy_all
Product.destroy_all

users = [
  { email: "louis@kellizi.xyz", password: "123456" },
  { email: "auriane@kellizi.xyz", password: "123456" },
  { email: "goncalo@kellizi.xyz", password: "123456" }
]

puts 'Creating 5 fake users...'
users.each do |user|
  User.create!(
    email: user[:email],
    password: user[:password]
  )
  puts "User #{user[:email]} created."
end

# users = User.all

categories = [
  "House", "Mobility", "Travel", "Healthcare", "Family", "Electronics", "Business", "Mortgage",
  "Legal Insurance", "Other"
]

companies = [
  "Matmut", "Axa", "Macif", "Stoïk", "Allianz",
  "GMF", "Aviva", "BNP Paribas Cardif", "Yuzzu", "AG insurance"
]

categories.each do |category|
  Category.create!(name: category)
  puts "Category created."
end

companies.each do |company|
  Company.create!(name: company)
  puts "Company created."
end

# products = [
#   "Housing", "Cyber security", "Car", "Motorbike", "Bike", "Pets", "Child", "Covid",
#   "Loan", "Card", "Household appliances", "Risky sport abroad", "Emergency repatriation",
#   "Legal protection"
# ]

products = [
  { name: "Car", category: "Mobility" },
  { name: "Motorbike", category: "Mobility" },
  { name: "Bike", category: "Mobility" },
  { name: "Scooter", category: "Mobility" },
  { name: "Household appliances", category: "Mortgage" },
  { name: "Loan", category: "Mortgage" },
  { name: "Cyber security", category: "Business" },
  { name: "Emergency repatriation", category: "Travel" },
  { name: "Pets", category: "Family" },
  { name: "Covid", category: "Healthcare" },
  { name: "Legal protection", category: "Legal Insurance" },
  { name: "Housing", category: "House" }
]

products.map do |product|
  product[:category] = Category.find_by(name: product[:category])
end

Company.all.each do |company|
  products.each do |product|
    Product.create!(name: product[:name], category: product[:category], company:)
    puts "Product created."
  end

end

User.all.each do |user|
  5.times do
    product = Product.all.sample

    Contract.create!(
      price: rand(1..100),
      source: [0, 1].sample,
      starts_at: "2021-07-30",
      ends_at: "2023-07-30",
      active: [true, false].sample,
      product:,
      user:,
      company: product.company, # do we need to store the company id here?
    )
  end
end
puts 'Finished!'
