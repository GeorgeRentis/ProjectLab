class CommentsController < ApplicationController
	
	def index
		@comments = Comment.where(lesson_id: params[:lesson_id])
	end
	
	def new
	@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@lesson = Lesson.where(id: @comment.lesson_id).first	
		if @comment.save
			redirect_to lesson_path(@lesson)
		else
			redirect_to lesson_path(@lesson)
		end
	end

	def comment_params
		params[:comment].permit(:comment,:user_id,:lesson_id)
	end
end
