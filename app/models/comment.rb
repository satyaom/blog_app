class Comment < ApplicationRecord
    belongs_to :blog
    validates :commenter, presence: true, length: { minimum:3 }    
    validates :body, presence: true, length: { minimum:10 }
end 
