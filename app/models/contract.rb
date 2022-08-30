class Contract < ApplicationRecord
  has_one_attached :pdf_contract
  has_one_attached :pdf_certificate

  belongs_to :user
  belongs_to :product
  belongs_to :company

  has_many :coverages
  enum :source, { work: 0, personal: 1 }
end
