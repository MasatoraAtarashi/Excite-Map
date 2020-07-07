class AddAllowPasswordChangeToUser < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :allow_password_change, :boolean, default: false, null: false
  end
end
