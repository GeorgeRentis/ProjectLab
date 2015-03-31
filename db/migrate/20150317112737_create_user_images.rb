class CreateUserImages < ActiveRecord::Migration
  def change
    create_table :user_images do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
