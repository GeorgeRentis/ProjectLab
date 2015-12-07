class LessonsController < ApplicationController
  def index
    if current_user
      if params[:category_id]!=nil
        @lessons = Lesson.where(category_id: params[:category_id])
      else
        @lessons = Lesson.search(params[:search])
      end
    else
      flash[:danger] = "You have to register to access this area"
      redirect_to root_path
    end
  end

  def show
    @lesson = Lesson.where(slug: params[:id]);
  end

  def show_author 
    @user = User.where(slug: params[:id])
  end
  
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
