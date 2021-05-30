class AddClientIdAndServiceClientIdToChats < ActiveRecord::Migration[6.1]
  def change
    add_column :chats, :client_id, :integer, null: false, foreign_key: true
    add_column :chats, :service_client_id, :integer, null: false, foreign_key: true
    add_index :chats, [:client_id, :service_client_id]
  end

end
