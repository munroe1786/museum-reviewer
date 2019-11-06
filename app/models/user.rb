class User < ActiveRecord::Base
    has_secure_password
    has_many :reviews
    has_many :museums, through: :reviews
end
