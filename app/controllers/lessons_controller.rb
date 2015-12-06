class LessonsController < ApplicationController
  def index
    if params[:category_id]!=nil
      @lessons = Lesson.where(category_id: params[:category_id])
    else
      @lessons = Lesson.search(params[:search])
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
