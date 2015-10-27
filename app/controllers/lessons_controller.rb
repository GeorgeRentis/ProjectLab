class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    @lessons = Lesson.where(category_id: params[:id]) if !params[:id].blank?
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
