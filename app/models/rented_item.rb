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
end