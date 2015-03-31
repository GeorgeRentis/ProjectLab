class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :description
      t.string :title
      t.integer :category_id
      t.string :level

      t.timestamps null: false
    end
  end
end
