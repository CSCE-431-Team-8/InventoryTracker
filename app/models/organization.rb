class Organization < ActiveRecord::Base
    has_many :memberships, dependent: :destroy
    has_many :users, through: :memberships
    has_many :items, dependent: :destroy
    has_many :rented_items, dependent: :destroy

    def join_org(user)
        i = memberships.new
        i.organization = self
        i.user = user
        i.admin = false
        i.save!
    end
end
