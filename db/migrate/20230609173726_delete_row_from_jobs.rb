class DeleteRowFromJobs < ActiveRecord::Migration[6.1]
  def change
    execute("DELETE FROM jobs WHERE id = 201")
  end
end
