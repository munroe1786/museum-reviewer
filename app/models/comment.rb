class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :reviewpage
    validates :content, presence: true
    def self.visible
        where(deleted: false)
    end
end
