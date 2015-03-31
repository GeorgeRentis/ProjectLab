class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :upload
      t.string :uploadable_type, index: true
      t.integer :uploadable_id, index: true

      t.timestamps
    end

    add_index :uploads,[:uploadable_id,:uploadable_type]
  end
end
