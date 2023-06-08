class Language < ApplicationRecord
  has_many :tracks
  has_one_attached :image

  validates :name, presence: true
end
