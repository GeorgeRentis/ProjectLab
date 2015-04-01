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
      redirect_to user_users_path
    else
      redirect_to user_users_path
    end
  end

  def edit
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to user_lessons_path
    else
      redirect_to user_lessons_path
    end
  end

  def lesson_params
    params[:lesson].permit(:title,:description,:category_id,:user_id,:level)
  end

  def find_lesson
    @lesson = Lesson.friendly.find(params[:id])
  end
end