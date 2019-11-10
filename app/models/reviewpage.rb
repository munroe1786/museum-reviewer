class ReviewPage < ActiveRecord::Base
    belongs_to :user
    has_many :comments

    validates :museum_name, presence: true
    validates :location, presence: true
    validates :date_visited, presence: true
    validates :content, presence: true
end
