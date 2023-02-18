require 'faker'
require 'open-uri'

puts 'Clearing all data'
Product.destroy_all

puts 'Creating products'

product_count = 20

product_count.times do |index|
  product = Product.new(
    name: Faker::Commerce.unique.product_name,
    description: Faker::TvShows::HowIMetYourMother.quote,
    price: rand(1..500_000),
    stock: rand(0..1000)
  )
  product.name = product.name[0..24] if product.name.size > 25
  product.description += ' This product is an exclusive collection' if product.description.size < 15
  file = URI.open('https://picsum.photos/200/300')
  product.photo.attach(
    io: file,
    filename: "product_image_#{index}.png",
    content_type: 'image/png'
  )
  product.save!
end

puts "All done! #{product_count} products were created."
