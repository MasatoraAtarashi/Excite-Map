class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  include Swagger::Blocks

  has_many :spots, dependent: :destroy
  has_many :spot_comments, dependent: :destroy

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

end
