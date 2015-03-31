class Admin::LessonRatingsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @lesson_rating = LessonRating.new
  end

  def create
    @lesson_rating = LessonRating.new(lesson_rating_params)
    @lesson_rating.avg = (@lesson_rating.communication + @lesson_rating.quality + @lesson_rating.teaching + @lesson_rating.general_grade) / 4
    if @lesson_rating.save
      redirect_to admin_root_path
    else
      redirect_to admin_root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def lesson_rating_params
    params[:lesson_rating].permit(:communication,:quality,:teaching,:general_grade,:lesson_id,:user_id,:avg)
  end
end
