class AddUserIdToImage < ActiveRecord::Migration
  def change
    add_column :user_images,:user_id,:integer,index: true
  end
end
