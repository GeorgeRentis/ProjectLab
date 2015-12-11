class RemoveFileFromLesson < ActiveRecord::Migration
  def change
  	remove_column :lessons, :file
  end
end
