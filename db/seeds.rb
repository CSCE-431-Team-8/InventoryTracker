# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


more_items = [
    {:name => 'Golf Ball', :description => 'A ball for golf', :quantity_remaining => 20, 
        :quantity_total => 25, :rentable => true, :price => 0},
    {:name => 'Tennis Ball', :description => 'A ball for tennis', :quantity_remaining => 10, 
        :quantity_total => 20, :rentable => true, :price => 0},
    {:name => 'Basket Ball', :description => 'A ball for basketball', :quantity_remaining => 5, 
        :quantity_total => 15, :rentable => true, :price => 0}
  ]
  
  more_items.each do |item|
    Item.create!(item)
  end