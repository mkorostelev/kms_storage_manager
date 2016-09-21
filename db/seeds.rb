10.times do
  Warehouse.create!(email: Faker::Internet.email)
end

10.times do
  Product.create!(title: Faker::Commerce.product_name)
end

30.times do
  StorageItem.create!(
    product: Product.offset(rand(Product.count)).first,
    warehouse: Warehouse.offset(rand(Warehouse.count)).first,
    quantity: rand(10) + 1
    )
end
