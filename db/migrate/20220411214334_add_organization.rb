class AddOrganization < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.belongs_to :organization, foreign_key: true
    end
  end
end
