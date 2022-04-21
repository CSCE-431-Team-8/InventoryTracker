class AddContactInfoToRentedItems < ActiveRecord::Migration
  def change
    add_column :rented_items, :address, :text
    add_column :rented_items, :phone_number, :string
    add_column :rented_items, :renter_name, :string
  end
end
