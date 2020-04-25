class Spot < ApplicationRecord
  
  validates :mood, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :comment, length: { maximum: 255 }
  validates :title, length: { maximum: 255 }

end
