class User < ActiveRecord::Base
    has_secure_password
    has_many :reviewpages
    has_many :comments

    validates :username, presence: true, uniqueness: true

    def self.visible
        where(deleted: false)
    end
end
