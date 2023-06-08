class Track < ActiveRecord::Base
  belongs_to :language
  has_many :lessons

  validates :title, presence: true
  validates :language, presence: true
end
