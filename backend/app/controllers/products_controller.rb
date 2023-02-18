class ProductsController < ApplicationController
  def index
    @products = Product.all
    @products = @products.map do |product|
      photo_url = Rails.application.routes.url_helpers.url_for(product.photo)
      product.as_json.merge({ photo: photo_url })
    end
    render json: @products
  end
end
