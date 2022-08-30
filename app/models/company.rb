class Company < ApplicationRecord
  has_many :products
  has_many :contracts, through: :products
end
