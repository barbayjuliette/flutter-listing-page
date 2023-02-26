class Product < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name,
                  against: %i[name],
                  using: { tsearch: { prefix: true, dictionary: 'english' } }
  validates :name, presence: true, length: { in: 4..30 }
  validates :description, presence: true, length: { in: 15..500 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }
  has_one_attached :photo
end
