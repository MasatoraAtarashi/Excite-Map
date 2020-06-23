class AddIsExcitePlaceToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :is_excite_place, :boolean, defalut: false
  end
end
