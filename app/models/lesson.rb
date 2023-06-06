class Lesson < ApplicationRecord
    belongs_to :track
    has_many :started_lessons,  dependent: :destroy
    has_many :hints, dependent: :destroy
    has_many :post, dependent: :destroy

    validates :title, presence: true
    validates :content, presence: true
    validates :track_id, presence: true
    validades :difficulty, presence: true
end
