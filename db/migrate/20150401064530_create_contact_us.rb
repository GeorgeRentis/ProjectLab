class CreateContactUs < ActiveRecord::Migration
  def change
    create_table :contact_us do |t|
      t.string :first_name
      t.string :string
      t.string :last_name
      t.string :string
      t.string :subject
      t.string :string
      t.string :email
      t.string :string
      t.string :message

      t.timestamps null: false
    end
  end
end
