class StorageItem < ApplicationRecord
  belongs_to :product

  belongs_to :warehouse

  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end
