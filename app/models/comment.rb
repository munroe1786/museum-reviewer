class Comment < ActiveRecord::Base
    belongs_to :users
    belongs_to :reviews
    
    validates :content, presence: true
end
