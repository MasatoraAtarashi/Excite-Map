class Spot < ApplicationRecord
  belongs_to :user
  has_many :spot_comments, dependent: :destroy

  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :mood, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :comment, length: { maximum: 255 }
  validates :title, length: { maximum: 255 }
  validate  :picture_size

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
