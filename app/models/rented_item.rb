class RentedItem < ActiveRecord::Base
    belongs_to :item
    belongs_to :organization
    # belongs_to :user

    # validates :name, presence: true
    # validates :quantity_total, numericality: { greater_than_or_equal_to: 0}
    # validates :quantity_remaining, presence: true
    # validates :rentable, inclusion: { in: [ true, false ] }

    def return_item
        self.item.increment!(:quantity_remaining, 1)
        self.delete
    end

    def self.search(search)
        where("cast(item_id as text) LIKE ? OR user_renting LIKE ? OR cast(age as text) LIKE ? OR cast(date_rented as text) LIKE ? OR cast(return_date as text) LIKE ? OR organization LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    end
end