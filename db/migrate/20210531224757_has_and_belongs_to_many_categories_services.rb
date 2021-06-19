class HasAndBelongsToManyCategoriesServices < ActiveRecord::Migration[6.1]
  def change
    create_table :categories_services, id: false do |t|
      t.belongs_to :service
      t.belongs_to :category
    end
    remove_column :services, :category_id
  end
end
