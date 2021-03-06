require 'rails_helper'

RSpec.describe "memberships/edit", type: :view do
  before(:each) do
    @membership = assign(:membership, Membership.create!(
      :organization => "MyString",
      :user => "MyString"
    ))
  end

  it "renders the edit membership form" do
    render

    assert_select "form[action=?][method=?]", membership_path(@membership), "post" do

      assert_select "input#membership_organization[name=?]", "membership[organization]"

      assert_select "input#membership_user[name=?]", "membership[user]"
    end
  end
end
