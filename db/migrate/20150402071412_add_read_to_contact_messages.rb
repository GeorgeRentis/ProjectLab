class AddReadToContactMessages < ActiveRecord::Migration
  def change
    add_column :contact_messages,:read,:boolean,default: false
  end
end
