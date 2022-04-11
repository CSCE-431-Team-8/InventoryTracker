require 'rails_helper'

RSpec.describe RentedItem, type: :model do

    before(:each) do
        @rented_item = RentedItem.create(organization: "TAMU spec", item_id: "1", user_renting: "Spec", age: "1", date_rented: "2022-04-04", return_date: "2022-04-28")
    end

    it 'checks that a rented item can be created' do
        expect(@rented_item).to be_valid
    end

    it 'checks that a rented item can be read' do
        expect(RentedItem.find_by_item_id("1")).to eq(@rented_item)
    end

    it 'checks that a rented item can be updated' do
        @rented_item.update(:organization => "SWE spec")
        expect(RentedItem.find_by_organization("SWE spec")).to eq(@rented_item)
    end

    it 'checks that a rented item can be destroyed' do
        @rented_item.destroy
        expect(RentedItem.find_by_item_id("1")).to be_nil
    end

end