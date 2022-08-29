class Company < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :contracts, through: :product
  has_many :coverages, through: :contract
end
