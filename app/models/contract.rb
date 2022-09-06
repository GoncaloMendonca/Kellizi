class Contract < ApplicationRecord
  has_one_attached :pdf_contract
  has_one_attached :pdf_certificate

  belongs_to :user
  belongs_to :product
  belongs_to :company

  validates :company_id, presence: true
  validates :product_id, presence: true
  validates :starts_at, presence: true

  has_many :coverages
  enum :source, { work: 0, personal: 1 }

  include PgSearch::Model
  pg_search_scope :search_by_company_and_product,
  # against: [ :title, :synopsis ],
  associated_against: {
    company: [:name],
    product: [:name],
  },
  using: {
    tsearch: { prefix: true }
  }

  delegate :category, to: :product
  delegate :company, to: :product

  # TIMINGS = ["Monthly", "Annually", "Specific Timing"]
end
