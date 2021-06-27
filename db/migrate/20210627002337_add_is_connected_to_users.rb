class AddIsConnectedToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_connected, :boolean, default: false
  end
end
