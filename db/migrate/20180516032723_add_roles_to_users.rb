class AddRolesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :integer, default: 0x00 # Default role is "user".
  end
end
