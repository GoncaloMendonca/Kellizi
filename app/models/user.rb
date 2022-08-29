class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :contracts, dependent: :destroy
  has_many :coverages, through: :contract
  has_many :products, through: :contract
  has_many :companies, through: :product
end
