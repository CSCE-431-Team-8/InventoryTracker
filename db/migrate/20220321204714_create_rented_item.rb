class CreateRentedItem < ActiveRecord::Migration
  def change
    create_table :rented_items do |t|
      t.string "organization"
      t.string "item_id"
      t.string "user_renting"
      t.decimal "age"
      t.date "date_rented"
      t.date "return_date"
      t.decimal "time_rented"
      t.decimal "max_rent_time"
      t.belongs_to :item, foreign_key: true
      t.timestamps
    end
  end
end
# ItemId
# ProductId
# UserRenting
# Age/Usage
# DateRented
# ReturnDate
# How long its been on loan
# How long can the item be rented for 

