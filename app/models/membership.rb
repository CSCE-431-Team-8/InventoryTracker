class Membership < ActiveRecord::Base
  belongs_to :organization
  belongs_to :user

  validates :user, uniqueness: {scope: :organization}
  validates :user, presence: true
  validates :organization, presence: true
  validates :admin, inclusion: { in: [ true, false ] }
end
