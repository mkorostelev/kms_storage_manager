class Warehouse < ApplicationRecord
  has_many :storage_items

  has_many :products, through: :storage_items

  has_many :items

  has_many :orders, through: :items

  validates :email, presence: true, uniqueness: { case_sensitive: false }, email: true
end
