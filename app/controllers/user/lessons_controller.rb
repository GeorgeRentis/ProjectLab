class User::LessonsController < ApplicationController
  before_action :find_lesson,only: [:edit,:update]

  def index
    @lessons = Lesson.where(user_id: current_user.id).all
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.user_id = current_user.id
    if @lesson.save
      flash[:success] = "Lesson Successfully created"
      redirect_to user_users_path
    else
      flash[:danger] = "Cannot create lesson"
      redirect_to user_users_path
    end
  end

  def edit
  end
  
  def update
    if @lesson.update(lesson_params)
      flash[:success] = "Lesson Successfully updated"
      redirect_to user_users_path
    else
      flash[:danger] = "Cannot update lesson"
      redirect_to user_users_path
    end
  end

  def lesson_params
    params[:lesson].permit(:title,:description,:category_id,:user_id,:level,uploads_attributes: [:id, :upload, :_destroy],comments_attributes: [:id, :comment,:user_id,:lesson_id, :_destroy])
  end

  def find_lesson
    @lesson = Lesson.friendly.find(params[:id])
  end
end