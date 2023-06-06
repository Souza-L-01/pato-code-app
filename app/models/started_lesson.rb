class StartedLesson < ApplicationRecord
    belongs_to :lesson 
    belongs_to :user

    validates :lesson_id, presence: true
    validades :user_id, presence: true
    validades :staus, presence: true
end
