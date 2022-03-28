class Item < ActiveRecord::Base

    validates :name, presence: true
    validates :quantity_total, numericality: { greater_than_or_equal_to: 0}
    validates :quantity_remaining, presence: true
    validates :rentable, inclusion: { in: [ true, false ] }
end