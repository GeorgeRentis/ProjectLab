class LessonRatingsController < ApplicationController

  def index
  end

  def new
  	@lesson_rating = LessonRating.new
  end

  def create
  	@lesson_rating = LessonRating.new(lesson_rating_params)
  	@lesson_rating.avg = (@lesson_rating.communication + @lesson_rating.quality + @lesson_rating.teaching + @lesson_rating.general_grade) / 4
		@lesson = Lesson.where(id: @lesson_rating.lesson_id).first	
		if @lesson_rating.save
      
      flash[:success] = "Rating Added"
			redirect_to lesson_path(@lesson)
		else

      flash[:danger] = "You cannot rate this lesson"
			redirect_to lesson_path(@lesson)
		end
  end

  def lesson_rating_params
		params[:lesson_rating].permit(:communication,:quality,:teaching,:general_grade,:avg,:user_id,:lesson_id)
	end

end
