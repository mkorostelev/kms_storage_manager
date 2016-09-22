class Order < ApplicationRecord
  enum status: [:accepted, :declined]

  has_many :items

  has_many :warehouses, through: :items

  has_one :product

  validates_presence_of :items

  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end
