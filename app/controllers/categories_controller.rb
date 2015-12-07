class CategoriesController < ApplicationController
  def index
  	if current_user
    	@categories = Category.all
    else
      flash[:danger] = "You have to register to access this area"
      redirect_to root_path
    end
  end
end
