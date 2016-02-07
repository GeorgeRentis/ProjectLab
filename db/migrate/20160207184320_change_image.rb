class ChangeImage < ActiveRecord::Migration
  def change
  	change_column :users, :default_avatar, :string, default: "https://cdn4.iconfinder.com/data/icons/info-graphics-4-glyph-free/64/one_user_data_graphic_info_infos-256.png"
  end
end
