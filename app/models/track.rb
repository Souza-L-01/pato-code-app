class Track < ApplicationRecord
    has_many :lessons

    validates :title, presence:true
    validates :language, presence: true
end
