# db/migrate/20230607123456_create_jobs.rb
class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :category
      t.string :title
      t.integer :salary
      t.string :location
      t.string :company
      t.timestamps

      t.references :category, foreign_key: true
    end
  end
end
