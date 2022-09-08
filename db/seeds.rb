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
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662472773/Source/logo-matmut_qd63o2.webp"
   },
   {
    name: "Axa",
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662472773/Source/axa_ll0ywb.png"
   },
   {
    name: "Macif",
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662472773/Source/Macif_ea1eeo.png"
   },
   {
    name: "Stoïk",
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662472773/Source/Stoik_p46jlx.png"
   },
   {
    name: "Allianz",
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662472772/Source/allianz_sxy4hy.svg"
   },
   {
    name: "GMF",
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662472773/Source/GMF_wwzdmc.png"
   },
   {
    name: "Aviva",
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662472772/Source/Aviva_ts1tuo.png"
   },
   {
    name: "BNP Paribas Cardif",
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662472772/Source/BNPPF_Cardif_kgypnq.svg"
   },
   {
    name: "Yuzzu",
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662472774/Source/yuzzu_o6orki.avif"
   },
   {
    name: "AG insurance",
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662472773/Source/AG-Insurance_pq7uxn.jpg"
   },
   {
    name: "Europ Assistance",
    logo: "https://res.cloudinary.com/kellizi/image/upload/v1662645773/Source/EuropAssistance_le1fru.png"
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
      timing: ["Monthly", "Annualy", "Specific period"].sample,
      company: product.company
    )
  end

  contract = Contract.create!(
    price: 41,
    source: 0,
    starts_at: "2022-07-30",
    ends_at: "2023-07-30",
    active: true,
    product: Product.find_by(name: "Housing", company: Company.find_by(name: "Yuzzu")),
    user:,
    timing: "Annualy",
    company: Company.find_by(name: "Yuzzu")
  )

  puts "Yuzzu contract created"

  Contract.create!(
    price: 91,
    source: 0,
    starts_at: "2022-07-30",
    ends_at: "2023-07-30",
    active: true,
    product: Product.find_by(name: "Cyber security", company: Company.find_by(name: "Stoïk")),
    user:,
    timing: "Monthly",
    company: Company.find_by(name: "Stoïk")
  )

  puts "Stoïk contract created"

  coverages = [
    "Fire, electrical incident. Under your proof. In your temporary accommodation.",
    "Unexpected collision with your home. In your possession during.",
    "Damage due to a natural event. In your temporary accommodation (rental).",
    "Burglary, vandalism and malicious damage. An assault with threats or brutality. In your garden or grounds"
  ]

  Coverage.create!(
    conditions: coverages[0],
    conditionb: coverages[1],
    conditionc: coverages[2],
    conditiond: coverages[3],
    contract:
  )
end

puts 'Finished!'
