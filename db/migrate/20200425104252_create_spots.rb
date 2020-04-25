class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :title
      t.string :comment
      t.string :string
      t.string :image
      t.string :string
      t.string :mood
      t.string :string
      t.string :latitude
      t.string :float
      t.string :longitude
      t.string :float

      t.timestamps
    end
  end
end
