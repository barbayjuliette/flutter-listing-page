# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'Clearing all data'
Product.destroy_all

puts 'Creating products'

20.times do
  product = Product.new(name: Faker::Creature::Animal.unique.name,
                        description: Faker::TvShows::HowIMetYourMother.quote,
                        price: rand(0.1..500).round(2),
                        stock: rand(0..1000))
  product.name += ' blue' if product.name.size < 4
  product.name[0..24] if product.name.size > 25
  product.description += 'This product is an exclusive collection' if product.description.size < 15

  product.save!
end

puts 'All done! 20 products were created.'
