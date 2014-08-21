require 'test_helper'

class CreateProductTest < ActionDispatch::IntegrationTest
  def test_create_product
    visit "/admin/products"
    click_on "Add New Product"
    fill_in "Name", with: 'Test'
    fill_in "Price", with: '5.00'
    product_id = Product.last.id
    page.has_content?("Product #{product_id} was created")
    
  end
end