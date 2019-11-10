class User < ActiveRecord::Base
    has_secure_password
    has_many :reviews
    has_many :comments

    validates :username, presence: true, uniqueness: true
end
