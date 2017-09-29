class StaticPagesController < ApplicationController
  def landing_page
    @products = Product.all
  end
  
  def index
  end
end
