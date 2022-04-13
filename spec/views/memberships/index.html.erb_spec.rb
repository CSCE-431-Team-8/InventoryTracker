require 'rails_helper'

RSpec.describe "memberships/index", type: :view do
  before(:each) do
    assign(:memberships, [
      Membership.create!(
        :organization => "Organization",
        :user => "User"
      ),
      Membership.create!(
        :organization => "Organization",
        :user => "User"
      )
    ])
  end

  it "renders a list of memberships" do
    render
    assert_select "tr>td", :text => "Organization".to_s, :count => 2
    assert_select "tr>td", :text => "User".to_s, :count => 2
  end
end
