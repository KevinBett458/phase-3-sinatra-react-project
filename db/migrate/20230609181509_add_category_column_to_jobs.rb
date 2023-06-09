class AddCategoryColumnToJobs < ActiveRecord::Migration[6.1]
  def change
    def up
      # Update existing records to set a non-null value for the category column
      Job.where(category: nil).update_all(category: 'Uncategorized')

      # Add the category column with null: false constraint
      change_column :jobs, :category, :string, null: false
    end

    def down
      # Revert the migration by removing the category column
      remove_column :jobs, :category
    end
  end
end
