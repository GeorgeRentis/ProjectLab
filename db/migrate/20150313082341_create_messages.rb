class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      t.integer :sender_id
      t.integer :receiver_id
      t.string :title

      t.timestamps null: false
    end
  end
end
