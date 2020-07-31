class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  devise :omniauthable
  include Swagger::Blocks

  has_many :spots, dependent: :destroy
  has_many :spot_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_spots, through: :likes, source: :spot

  swagger_schema :User do
    key :required, [:id, :email, :created_at, :updated_at, :provider, :uid, :username, :admin]
    property :id do
      key :type, :integer
      key :format, :int64
    end
    property :email do
      key :type, :string
    end
    property :created_at do
      key :type, :datetime
    end
    property :updated_at do
      key :type, :datetime
    end
    property :provider do
      key :type, :string
    end
    property :uid do
      key :type, :string
    end
    property :username do
      key :type, :string
    end
    property :admin do
      key :type, :boolean
    end
  end

  mount_uploader :picture, PictureUploader

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

  private
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
