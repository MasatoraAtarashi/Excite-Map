class Spot < ApplicationRecord
  include Swagger::Blocks

  swagger_schema :Spot do
    key :required, %i[id title description mood picture latitude longitude is_excite_place user comments]
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
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :mood, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :description, length: { maximum: 255 }
  validates :title, length: { maximum: 255 }
  validate  :picture_size

  scope :ochitsuku, ->(user) do
    where(user_id: user.id).where(mood: '🌱落ち着く')
  end

  scope :tanoshi, ->(user) do
    where(user_id: user.id).where(mood: '🔆楽しい')
  end

  scope :shiawase, ->(user) do
    where(user_id: user.id).where(mood: '🧤幸せ')
  end

  scope :yaruki, ->(user) do
    where(user_id: user.id).where(mood: '🔥やる気')
  end

  scope :fuman, ->(user) do
    where(user_id: user.id).where(mood: '🌀不満')
  end

  scope :zetsubou, ->(user) do
    where(user_id: user.id).where(mood: '🚨絶望感')
  end

  scope :search_by_keyword, ->(keyword) do
    where('LOWER(title) LIKE ?', "%#{keyword}%")
    .or(where('LOWER(description) LIKE ?', "%#{keyword}%"))
    .or(where('LOWER(mood) LIKE ?', "%#{keyword}%"))
  end

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, 'should be less than 5MB')
    end
  end
end
