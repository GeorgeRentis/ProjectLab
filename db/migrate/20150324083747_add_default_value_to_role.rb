class AddDefaultValueToRole < ActiveRecord::Migration
  def change
    change_column :users,:role_id,:integer,default: "user"
  end
end
