# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'open-uri'

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

puts 'Creating 3 users...'
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
   {
    name: "Matmut",
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662472773/production/logo-matmut_qd63o2.webp"
   },
   {
    name: "Axa",
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662472773/production/axa_ll0ywb.png"
   },
   {
    name: "Macif",
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662472773/production/Macif_ea1eeo.png"
   },
   {
    name: "Stoïk",
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662472773/production/Stoik_p46jlx.png"
   },
   {
    name: "Allianz",
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662472772/production/allianz_sxy4hy.svg"
   },
   {
    name: "GMF",
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662472773/production/GMF_wwzdmc.png"
   },
   {
    name: "Aviva",
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662472772/production/Aviva_ts1tuo.png"
   },
   {
    name: "BNP Paribas Cardif",
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662472772/production/BNPPF_Cardif_kgypnq.svg"
   },
   {
    name: "Yuzzu",
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662472774/production/yuzzu_o6orki.avif"
   },
   {
    name: "AG insurance",
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662472773/production/AG-Insurance_pq7uxn.jpg"
   }
]

categories.each do |category|
  Category.create!(name: category)
  puts "Category created."
end

companies.each do |company|
  insurance = Company.new(name: company[:name])
  logo = URI.open(company[:logo])
  insurance.logo.attach(io: logo, filename: "#{company[:name]}.png", content_type: "image/png")
  insurance.save
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
    Product.create!(name: "#{company[:name]} - #{product[:name]}", category: product[:category], company:)
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
