class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.boolean :state
      t.text :message

      t.timestamps

      
      t.references :notificable, polymorphic: true
      t.integer :sender_id, null: false, foreign_key:true
      t.integer :receiver_id, null: false, foreign_key: true

    end    

    
  end
end
