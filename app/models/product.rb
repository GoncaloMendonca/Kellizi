class Product < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :contracts
  has_many :coverages, through: :contract
end
