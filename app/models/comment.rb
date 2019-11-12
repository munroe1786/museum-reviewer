class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :reviewpage
    validates :content, presence: true
end
