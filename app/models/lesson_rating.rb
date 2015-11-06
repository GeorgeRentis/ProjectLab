class LessonRating < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :user
  validates_uniqueness_of :user_id,:scope => :lesson_id


  
end
