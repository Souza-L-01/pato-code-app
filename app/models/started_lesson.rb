class StartedLesson < ActiveRecord::Base
    belongs_to :lesson 
    belongs_to :user

    validates :lesson_id, presence: true
    validates :user_id, presence: true
    validates :staus, presence: true
end
