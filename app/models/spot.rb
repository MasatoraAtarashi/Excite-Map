class Spot < ApplicationRecord
  include Swagger::Blocks

  swagger_schema :Spot do
    key :required, [:id, :title, :description, :mood, :picture, :latitude, :longitude, :is_excite_place, :user, :comments]
    property :id do
      key :type, :integer
      key :format, :int64
    end
    property :title do
      key :type, :string
    end
    property :description do
      key :type, :string
    end
    property :mood do
      key :type, :string
    end
    property :picture do
      key :type, :string
    end
    property :latitude do
      key :type, :string
    end
    property :longitude do
      key :type, :string
    end
    property :is_excite_place do
      key :type, :boolean
    end
    property :user do
      key :'$ref', :User
    end
    property :comments do
      key :'$ref', :SpotComment
    end
  end

  belongs_to :user
  has_many :spot_comments, dependent: :destroy

  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :mood, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :description, length: { maximum: 255 }
  validates :title, length: { maximum: 255 }
  validate  :picture_size

  scope :ochitsuku, ->(spots) do
    where(mood: '落ち着く')
  end

  scope :tanoshi, ->(spots) do
    where(mood: '楽しい')
  end

  scope :shiawase, ->(spots) do
    where(mood: '幸せ')
  end

  scope :yaruki, ->(spots) do
    where(mood: 'やる気')
  end

  scope :fuman, ->(spots) do
    where(mood: '不満')
  end

  scope :zetsubou, ->(spots) do
    where(mood: '絶望感')
  end
  
  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
