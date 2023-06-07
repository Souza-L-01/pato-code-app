class Post < ActiveRecord::Base
    belongs_to :user
    belongs_to :lesson
    has_many :comments, dependent: :destroy
    
    validates :content, presence: true
    validates :title, presence: true
    validates :timestamp, presence: true
    validates :lesson_id, presence: true
    validates :user_id, presence: true
    
    default_scope -> { order(created_at: :desc) }
    
    def self.from_users_followed_by(user)
        followed_user_ids = "SELECT followed_id FROM relationships
                             WHERE follower_id = :user_id"
        where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
            user_id: user.id)
    end
end