class CreateUserRatings < ActiveRecord::Migration
  def change
    create_table :user_ratings do |t|
      t.integer :communication
      t.integer :quality 
      t.integer :teaching 
      t.integer :general_grade 
      t.integer :lesson_id 
      t.integer :user_id 
      t.integer :avg 
      

      t.timestamps null: false
    end
  end
end
