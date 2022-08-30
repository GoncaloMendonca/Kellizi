class Contract < ApplicationRecord
  belongs_to :user
  belongs_to :product

  has_many :coverages

  enum :source, { work: 0, personal: 1 }
end
