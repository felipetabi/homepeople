class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :chat, null: false, foreign_key: true
      t.text :body
      t.integer :sender_id
      t.integer :receiver_id
      t.timestamps
    end
    add_index :messages, [:sender_id, :receiver_id]
  end
end
