class Track < ActiveRecord::Base
  belongs_to :language, dependent: :destroy
  has_many :lessons

  validates :title, presence: true
  validates :language, presence: true
end
