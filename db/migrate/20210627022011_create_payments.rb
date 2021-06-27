class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.datetime :expired_at
      t.references :user, null: false, foreign_key: true
      t.integer :kind

      t.timestamps
    end
  end
end
