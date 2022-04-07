require 'rails_helper'

RSpec.describe "rented_items/index", type: :view do
  before(:each) do
    assign(:rented_items, [
      RentedItem.create!(
        :organization => "Organization",
        :item_id => "Item",
        :user_renting => "User Renting",
        :age => "Age",
        :date_rented => "Date Rented",
        :return_date => "Return Date",
        :time_rented => "Time Rented",
        :max_rent_time => "Max Rent Time"
      ),
      RentedItem.create!(
        :organization => "Organization",
        :item_id => "Item",
        :user_renting => "User Renting",
        :age => "Age",
        :date_rented => "Date Rented",
        :return_date => "Return Date",
        :time_rented => "Time Rented",
        :max_rent_time => "Max Rent Time"
      )
    ])
  end

  it "renders a list of rented_items" do
    render
    assert_select "tr>td", :text => "Organization".to_s, :count => 2
    assert_select "tr>td", :text => "Item".to_s, :count => 2
    assert_select "tr>td", :text => "User Renting".to_s, :count => 2
    assert_select "tr>td", :text => "Age".to_s, :count => 2
    assert_select "tr>td", :text => "Date Rented".to_s, :count => 2
    assert_select "tr>td", :text => "Return Date".to_s, :count => 2
    assert_select "tr>td", :text => "Time Rented".to_s, :count => 2
    assert_select "tr>td", :text => "Max Rent Time".to_s, :count => 2
  end
end
