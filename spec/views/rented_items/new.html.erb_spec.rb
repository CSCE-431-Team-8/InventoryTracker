require 'rails_helper'

RSpec.describe "rented_items/new", type: :view do
  before(:each) do
    assign(:rented_item, RentedItem.new(
      :organization => "MyString",
      :item_id => "MyString",
      :user_renting => "MyString",
      :age => "MyString",
      :date_rented => "MyString",
      :return_date => "MyString",
      :time_rented => "MyString",
      :max_rent_time => "MyString"
    ))
  end

  it "renders new rented_item form" do
    render

    assert_select "form[action=?][method=?]", rented_items_path, "post" do

      assert_select "input#rented_item_organization[name=?]", "rented_item[organization]"

      assert_select "input#rented_item_item_id[name=?]", "rented_item[item_id]"

      assert_select "input#rented_item_user_renting[name=?]", "rented_item[user_renting]"

      assert_select "input#rented_item_age[name=?]", "rented_item[age]"

      assert_select "input#rented_item_date_rented[name=?]", "rented_item[date_rented]"

      assert_select "input#rented_item_return_date[name=?]", "rented_item[return_date]"

      assert_select "input#rented_item_time_rented[name=?]", "rented_item[time_rented]"

      assert_select "input#rented_item_max_rent_time[name=?]", "rented_item[max_rent_time]"
    end
  end
end
