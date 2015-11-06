class HomepageController < ApplicationController

  def index
  	@lessons = Lesson.order("created_at desc").limit(3)
  end

  def contact_us
  end

  def faq
  end

  def about_us
  end
end
