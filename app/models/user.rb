class User < ActiveRecord::Base
    has_many :memberships
    has_many :organizations, through: :memberships
    has_secure_password
    validates :email, presence: true
    validates :email, uniqueness: true

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.name = response[:info][:name]
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(15)
        end
    end
end

