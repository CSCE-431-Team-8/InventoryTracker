require 'rails_helper'

RSpec.describe "memberships/show", type: :view do
  before(:each) do
    @membership = assign(:membership, Membership.create!(
      :organization => "Organization",
      :user => "User"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Organization/)
    expect(rendered).to match(/User/)
  end
end
