class AddInfoToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :description, :text
    add_column :organizations, :phone_number, :string
    add_column :organizations, :address, :text
  end
end
