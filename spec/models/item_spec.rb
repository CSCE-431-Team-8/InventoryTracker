require 'rails_helper'

RSpec.describe Item, type: :model do

    before(:each) do
        @item = Item.create(name: "Basketballs spec", quantity_remaining: 10, quantity_total: 15, price: 10, rentable: true)
    end

    it 'checks that an item can be created' do
        expect(@item).to be_valid
    end

    it 'checks that an item can be read' do
        expect(Item.find_by_name("Basketballs spec")).to eq(@item)
    end

    it 'checks that an item can be updated' do
        @item.update(:name => "Tennisball spec")
        expect(Item.find_by_name("Tennisball spec")).to eq(@item)
    end

    it 'checks that an item can be destroyed' do
        @item.destroy
        expect(Item.find_by_name("Tennisball spec")).to be_nil
    end

    it 'is not valid without a name' do 
        @item_temp = Item.create(name: nil, quantity_remaining: 10, quantity_total: 15, price: 10)
        expect(@item_temp).not_to be_valid
    end

    it 'is not valid without a quantity remaining' do 
        @item_temp2 = Item.create(name: "Baseball spec", quantity_remaining: nil, quantity_total: 15, price: 10)
        expect(@item_temp2).not_to be_valid
    end

    it 'is not valid if total quantity is less than 0' do 
        @item_temp3 = Item.create(name: "Baseball spec", quantity_remaining: 10, quantity_total: -1, price: 10)
        expect(@item_temp3).not_to be_valid
    end

    it 'creates a new rented item' do
        @item.add_rented_item("Ryan")
        @renteditem = RentedItem.find_by_item_id(@item.id)
        expect(@renteditem.item).to eq(@item)
    end

end