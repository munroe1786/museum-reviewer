class Reviewpage < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    validates :museum_name, :location, :date_visited, :content, presence: true
    def self.visible
        where(deleted: false)
    end
end
