# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
    Organization.create!(
        name: Faker::Company.name,
        description: Faker::Company.catch_phrase,
        phone_number: Faker::Number.number(digits: 10),
        address: Faker::Address.full_address
    )
end

2000.times do 
    Item.create!(
        name: Faker::Commerce.product_name, 
        description: Faker::Marketing.buzzwords,
        quantity_remaining: Faker::Number.between(from: 1, to: 20),
        quantity_total: Faker::Number.between(from: 25, to: 50),
        rentable: true,
        price: Faker::Commerce.price,
        location: Faker::Commerce.department(max: 1, fixed_amount: true),
        organization: Organization.order('RANDOM()').first
    )
end