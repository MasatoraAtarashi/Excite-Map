class Like < ApplicationRecord
  belongs_to :spot
  belongs_to :user
  validates_uniqueness_of :spot_id, scope: :user_id
end
