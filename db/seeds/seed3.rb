10.times do
  CountryOfOrigin.create(
    name: Faker::Address.country
  )
end

10.times do
  Pfeature.create(
    name: Faker::Commerce.color
  )
end

7.times do
  Product.create(
    name: Faker::Commerce.product_name,
    country_of_origin_id: Faker::Number.within(range: 1..5)
  )
end



