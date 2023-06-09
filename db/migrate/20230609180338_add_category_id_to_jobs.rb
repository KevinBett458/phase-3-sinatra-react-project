class AddCategoryIdToJobs < ActiveRecord::Migration[6.1]
  def change
    remove_column :jobs, :category
  end
end
