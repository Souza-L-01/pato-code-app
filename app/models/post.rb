class Post < ActiveRecord
    belongs_to :user
    belongs_to :lesson
    has_many :comments, dependent: :destroy
    
    validates :content, presence: true
    validades :title, presence: true
    validades :timestamp, presence: true
    validades :lesson_id, presence: true
    validates :user_id, presence: true
    
    default_scope -> { order(created_at: :desc) }
    
    def self.from_users_followed_by(user)
        followed_user_ids = "SELECT followed_id FROM relationships
                             WHERE follower_id = :user_id"
        where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
            user_id: user.id)
    end
end