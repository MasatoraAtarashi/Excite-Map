class AddUserIdToSpot < ActiveRecord::Migration[5.2]
  def change
    add_reference :spots, :user, foreign_key: true

    add_index :spots, [:id, :user_id]
  end
end
