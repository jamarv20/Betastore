require './config/environment'

50.times do |p|
  p = Product.new(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price)
  
  p.save
 end
 
 Product.order('price desc nulls last').limit(3).each do |p|
  puts "%s $%0.2f" % [p.name, p.price.to_f]
  end

  puts
  puts "Total number of products: %d" % Product.count
  puts "Average product price: $%0.2f" % Product.average(:price) 