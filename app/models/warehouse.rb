class Warehouse < ApplicationRecord
  has_many :storage_items

  has_many :products, through: :storage_items
end
