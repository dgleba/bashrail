class ChangeUsersRoleIdDefault < ActiveRecord::Migration[5.0]

  def change
  change_column :users, :role_id, :integer, :default => 3
  end
  
end
