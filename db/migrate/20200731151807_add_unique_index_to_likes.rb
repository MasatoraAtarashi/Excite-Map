class AddUniqueIndexToLikes < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, %i[user_id spot_id], unique: true
  end
end
