# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# organizationTAMU = Organization.create!({:name => "TAMU", :phone_number => "9798453211", :description => "Texas A&M University", :address => "Administration Building, 400 Bizzell St, College Station, TX 77843"})
# organizationSWE = Organization.create!({:name => "SWE", :phone_number => "5555555555", :description => "Society of Women Engineers", :address => "1 Tamu Way"})

# more_items = [
#     {:name => 'Golf Ball', :description => 'A ball for golf', :quantity_remaining => 20, 
#         :quantity_total => 25, :rentable => false, :price => 5, :location => "Gear Locker", :organization => organizationTAMU},
#     {:name => 'Tennis Ball', :description => 'A ball for tennis', :quantity_remaining => 10, 
#         :quantity_total => 20, :rentable => true, :price => 10, :location => "Gear Locker", :organization => organizationSWE},
#     {:name => 'Basket Ball', :description => 'A ball for basketball', :quantity_remaining => 5, 
#         :quantity_total => 15, :rentable => true, :price => 0, :location => "Backwall", :organization => organizationSWE}
#   ]

  
  
#   more_items.each do |item|
#     Item.create!(item)
#   end

50.times do
    Organization.create!(
        name: Faker::Company.name,
        description: Faker::Company.catch_phrase,
        phone_number: Faker::Number.number(digits: 10),
        address: Faker::Address.full_address
    )
end

1000.times do 
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