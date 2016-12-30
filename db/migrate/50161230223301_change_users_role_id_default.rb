class ChangeUsersRoleIdDefault < ActiveRecord::Migration

  def change
  change_column :users, :role_id, :integer, :default => 7
  end
  
end
