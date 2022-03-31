require "rails_helper"

RSpec.describe RentedItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/rented_items").to route_to("rented_items#index")
    end

    it "routes to #new" do
      expect(:get => "/rented_items/new").to route_to("rented_items#new")
    end

    it "routes to #show" do
      expect(:get => "/rented_items/1").to route_to("rented_items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rented_items/1/edit").to route_to("rented_items#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/rented_items").to route_to("rented_items#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/rented_items/1").to route_to("rented_items#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/rented_items/1").to route_to("rented_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rented_items/1").to route_to("rented_items#destroy", :id => "1")
    end
  end
end
