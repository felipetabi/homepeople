class RemoveTitleFromServices < ActiveRecord::Migration[6.1]
  def change
    remove_column :services, :title, :string
  end
end
