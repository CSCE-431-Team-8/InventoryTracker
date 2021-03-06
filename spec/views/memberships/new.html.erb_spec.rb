require 'rails_helper'

RSpec.describe "memberships/new", type: :view do
  before(:each) do
    assign(:membership, Membership.new(
      :organization => "MyString",
      :user => "MyString"
    ))
  end

  it "renders new membership form" do
    render

    assert_select "form[action=?][method=?]", memberships_path, "post" do

      assert_select "input#membership_organization[name=?]", "membership[organization]"

      assert_select "input#membership_user[name=?]", "membership[user]"
    end
  end
end
