class AddSlugToLesson < ActiveRecord::Migration
  def change
    add_column :lessons,:slug,:string,unique: true
  end
end
