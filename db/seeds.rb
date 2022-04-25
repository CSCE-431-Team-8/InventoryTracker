# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

organizationTAMU = Organization.create!({:name => "TAMU", :phone_number => "9798453211", :description => "Texas A&M University", :address => "Administration Building, 400 Bizzell St, College Station, TX 77843"})
organizationSWE = Organization.create!({:name => "SWE", :phone_number => "5555555555", :description => "Society of Women Engineers", :address => "1 Tamu Way"})

more_items = [
    {:name => 'Golf Ball', :description => 'A ball for golf', :quantity_remaining => 20, 
        :quantity_total => 25, :rentable => false, :price => 5, :location => "Gear Locker", :organization => organizationTAMU},
    {:name => 'Tennis Ball', :description => 'A ball for tennis', :quantity_remaining => 10, 
        :quantity_total => 20, :rentable => true, :price => 10, :location => "Gear Locker", :organization => organizationSWE},
    {:name => 'Basket Ball', :description => 'A ball for basketball', :quantity_remaining => 5, 
        :quantity_total => 15, :rentable => true, :price => 0, :location => "Backwall", :organization => organizationSWE}
  ]

  
  
  more_items.each do |item|
    Item.create!(item)
  end