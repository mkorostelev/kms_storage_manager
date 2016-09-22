class Product < ApplicationRecord
  has_many :storage_items

  has_many :warehouses, through: :storage_items

  validates :title, presence: true
end
