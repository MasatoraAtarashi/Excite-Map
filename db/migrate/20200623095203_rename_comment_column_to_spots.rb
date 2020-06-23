class RenameCommentColumnToSpots < ActiveRecord::Migration[5.2]
  def change
    rename_column :spots, :comment, :description
  end
end
