# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'open-uri'

puts 'Clearing all data'
Product.destroy_all

puts 'Creating products'

20.times do
  product = Product.new(name: Faker::Commerce.unique.product_name,
                        description: Faker::TvShows::HowIMetYourMother.quote,
                        price: rand(1..500_000),
                        stock: rand(0..1000))
  product.name += ' blue' if product.name.size < 4
  product.name = product.name[0..24] if product.name.size > 25
  product.description += ' This product is an exclusive collection' if product.description.size < 15
  file = URI.open("https://picsum.photos/200/300")
  product.photo.attach(io: file, filename: "prod.png", content_type: "image/png")
  product.save!
end

puts 'All done! 20 products were created.'
