class SpotComment < ApplicationRecord
    include Swagger::Blocks

    swagger_schema :SpotComment do
        key :required, [:id, :content, :user_id, :spot_id, :created_at, :updated_at]
        property :id do
            key :type, :integer
            key :format, :int64
        end
        property :content do
            key :type, :text
        end
        property :user_id do
            key :type, :integer
            key :format, :int64g
        end
        property :spot_id do
            key :type, :integer
            key :format, :int64g
        end
        property :created_at do
            key :type, :datetime
        end
        property :updated_at do
            key :type, :datetime
        end
    end

    belongs_to :user
    belongs_to :spot
    validates :content, presence: true
    validates :user_id, presence: true
    validates :spot_id, presence: true
end
