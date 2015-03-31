class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :msg
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
