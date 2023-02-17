class Product < ApplicationRecord
  validates :name, presence: true, length: { in: 4..25 }, uniqueness: true
  validates :description, presence: true, length: { in: 15..500 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
