class Item < ActiveRecord::Base

    validates :name, presence: true
    validates :quantity_total, presence: true
    validates :quantity_remaining, presence: true
end