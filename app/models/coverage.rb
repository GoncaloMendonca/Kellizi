class Coverage < ApplicationRecord
  belongs_to :contract
  belongs_to :user
  belongs_to :product
  belongs_to :company
end
