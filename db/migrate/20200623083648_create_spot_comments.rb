class CreateSpotComments < ActiveRecord::Migration[5.2]
  def change
    create_table :spot_comments do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :spot, foreign_key: true
      t.timestamps
    end
    add_index :spot_comments, [:user_id, :spot_id], unique: true
  end
end
