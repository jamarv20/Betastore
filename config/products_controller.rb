class Admin::ProductsController < ApplicationController
  def index
    @products = Product.order('name')

  end
end

