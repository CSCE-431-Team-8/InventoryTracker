require 'rails_helper'

RSpec.describe "RentedItems", type: :request do
  describe "GET /rented_items" do
    it "works! (now write some real specs)" do
      get rented_items_path
      expect(response).to have_http_status(200)
    end
  end
end
