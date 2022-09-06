class Company < ApplicationRecord
  has_many :products
  # has_many :contracts, through: :products
  has_one_attached :logo
end
