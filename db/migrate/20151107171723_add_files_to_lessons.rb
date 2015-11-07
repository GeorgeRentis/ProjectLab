class AddFilesToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :file, :string
  end
end
