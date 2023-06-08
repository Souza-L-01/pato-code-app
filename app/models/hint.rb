class Hint < ActiveRecord::Base
  belongs_to :lesson

  validates :content, presence: true
  validates :lesson_id, presence: true
end
