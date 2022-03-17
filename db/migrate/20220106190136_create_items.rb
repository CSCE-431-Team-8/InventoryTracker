class CreateItems < ActiveRecord::Migration
  def change
    create_table 'items' do |t|
      t.string 'name'
      t.text 'description'
      t.decimal 'quantity_remaining'
      t.decimal 'quantity_total'
      t.boolean 'rentable'
      t.float 'price'
      # Add fields that let Rails automatically keep track
      # of when items are added or modified:
      t.timestamps
    end
  end
end