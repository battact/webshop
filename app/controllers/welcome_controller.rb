class WelcomeController < ApplicationController
  def index
    @top_products = Product.first(4)
    @other_products = Product.first(6)
    @categories = Category.all.sample(6)
  end
end
