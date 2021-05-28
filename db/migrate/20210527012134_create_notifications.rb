class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.boolean :state
      t.text :message

      t.timestamps

      t.references :booking, null: false

      t.integer :sender_id
      t.integer :receiver_id

    end    
  end
end
