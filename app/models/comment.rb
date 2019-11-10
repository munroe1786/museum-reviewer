class Comment < ActiveRecord::Base
    belongs_to :users
    belongs_to :reviewpages

    
    validates :content, presence: true
end
