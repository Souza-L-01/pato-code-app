class Track < ActiveRecord::Base
  has_many :lessons

  validates :title, presence:true
  validates :language, presence: true
end
