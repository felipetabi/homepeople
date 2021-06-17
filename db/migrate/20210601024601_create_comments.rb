class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.float :rating, default: 0.0
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
