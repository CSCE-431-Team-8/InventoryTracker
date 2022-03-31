require 'rails_helper'

RSpec.describe "rented_items/show", type: :view do
  before(:each) do
    @rented_item = assign(:rented_item, RentedItem.create!(
      :organization => "Organization",
      :item_id => "Item",
      :user_renting => "User Renting",
      :age => "Age",
      :date_rented => "Date Rented",
      :return_date => "Return Date",
      :time_rented => "Time Rented",
      :max_rent_time => "Max Rent Time"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Organization/)
    expect(rendered).to match(/Item/)
    expect(rendered).to match(/User Renting/)
    expect(rendered).to match(/Age/)
    expect(rendered).to match(/Date Rented/)
    expect(rendered).to match(/Return Date/)
    expect(rendered).to match(/Time Rented/)
    expect(rendered).to match(/Max Rent Time/)
  end
end
