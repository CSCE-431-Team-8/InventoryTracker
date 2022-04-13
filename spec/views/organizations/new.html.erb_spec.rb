require 'rails_helper'

RSpec.describe "organizations/new", type: :view do
  before(:each) do
    assign(:organization, Organization.new(
      :Name => "MyString"
    ))
  end

  it "renders new organization form" do
    render

    assert_select "form[action=?][method=?]", organizations_path, "post" do

      assert_select "input#organization_Name[name=?]", "organization[Name]"
    end
  end
end
