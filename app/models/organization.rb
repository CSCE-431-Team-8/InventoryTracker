class Organization < ActiveRecord::Base
    has_many :users, through: :membership
    has_many :items, dependent: :destroy
    has_many :rented_items, dependent: :destroy
end
