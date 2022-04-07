class Item < ActiveRecord::Base
    has_many :rented_items, dependent: :destroy
    # belongs_to :organization

    validates :name, presence: true
    validates :quantity_total, numericality: { greater_than_or_equal_to: 0}
    validates :quantity_remaining, presence: true
    validates :rentable, inclusion: { in: [ true, false ] }

    def add_rented_item(user)
        self.decrement!(:quantity_remaining, 1)
        i = rented_items.new
        i.item_id = self.id
        i.item = self
        i.user_renting = user
        i.age = rand(20)
        i.date_rented = Date.today.to_s
        i.return_date = Date.today + 14
        i.organization = self.organization

        i.save!
    end

    def self.search(search)
        # where("name LIKE ?", "%#{search}%") 
        # where("description LIKE ?", "%#{search}%") 
        # where("location LIKE ?", "%#{search}%") 
        # where("id LIKE ?", "%#{search}%")
        where("name LIKE ? OR description LIKE ? OR location LIKE ? OR id LIKE ? OR organization LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    end
end

# string "organization"
#       t.string "item_id"
#       t.string "user_renting"
#       t.decimal "age"
#       t.date "date_rented"
#       t.date "return_date"
#       t.decimal "time_rented"
#       t.decimal "max_rent_time"