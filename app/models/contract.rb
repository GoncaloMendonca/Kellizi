class Contract < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :company
  has_many :coverages

  validates :created_at, presence: true
end
