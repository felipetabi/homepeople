class AddMoreInformationToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :last_job, :string
    add_column :services, :start_date_last_job, :datetime
    add_column :services, :end_date_last_job, :datetime
    add_column :services, :description_last_job, :text
    add_column :services, :categories_last_job, :string, array: true, default: []
  end
end
