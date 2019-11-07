class User < ActiveRecord::Base
    has_secure_password
    has_many :reviews
    has_many :museums, through: :reviews

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true
    #validates :password, presence true
end
