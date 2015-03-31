class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :upload
      t.string :uploadable_type, index: true
      t.integer :uploadable_id, index: true

      t.timestamps null: false
    end
    add_index :images,[:uploadable_id,:uploadable_type]
  end
end
