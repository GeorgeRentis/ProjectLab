class HomepageController < ApplicationController

  def index
  	@lessons_ratings = LessonRating.order("avg desc").limit(3)
  end

  def contact_us
  end

  def faq
  end

  def about_us
  end
end
