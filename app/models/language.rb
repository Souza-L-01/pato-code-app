class Language < ApplicationRecord
  has_many :tracks, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true
end
