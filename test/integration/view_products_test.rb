require 'test_helper'

class ViewProductsTest < ActionDispatch::IntegrationTest
  def test_view_products
    visit "/"
    assert page.has_content?("19.99"),
      'could not find product price'
    click_link 'Hat'
    assert page.has_content?('This is a Product'),
      'could not find description'
    click_on 'Add to Cart'
    assert page.has_content?('Shopping Cart'),
      'could not find page title'
     save_and_open_page
    assert page.has_content?('19.99')
      'could not find total'
    click_link "Hat"
    click_on 'Add to Cart'
    assert page.has_content?('19.99')   
  end  
end  