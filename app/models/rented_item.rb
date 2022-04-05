class RentedItem < ActiveRecord::Base
    belongs_to :item
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
        where("item_id LIKE ? OR user_renting LIKE ? OR age LIKE ? OR date_rented LIKE ? OR return_date LIKE ? OR organization LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    end
end