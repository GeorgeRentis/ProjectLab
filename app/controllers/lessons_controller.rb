class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    @lessons = Lesson.where(category_id: params[:id]) if !params[:id].blank?
  end

  def show
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
