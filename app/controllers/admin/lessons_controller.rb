class Admin::LessonsController < Admin::AdminController
  before_action :find_lesson,only: [:edit,:update,:destroy]

  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
  end

  def show
  end

  def create
    @lesson = Lesson.new(admin_lesson_params)
    @lesson.user_id = current_user.id
    if @lesson.save
      flash[:success] = "Lesson Successfully added"
      redirect_to admin_lessons_path
    else
      flash[:danger] = "Cannot create."
      redirect_to new_admin_lesson_path
    end
  end

  def edit
  end

  def update
    @lesson.slug = params[:lesson][:title]
    if @lesson.update(admin_lesson_params)
      flash[:success] = "Lesson Successfully edited"
      redirect_to admin_lessons_path
    else
      flash[:danger] = "Cannot edit."
      redirect_to admin_lessons_path
    end
  end

  def destroy
    if @lesson.destroy
      flash[:success] = "Lesson Successfully destoryed"
      redirect_to admin_lessons_path
    else
      flash[:danger] = "Cannot destroy."
      redirect_to admin_lessons_path
    end
  end

  def new_rating
    @rating = LessonRating.new
  end

  private
  def admin_lesson_params
    params[:lesson].permit(:title, :description,:category_id, :slug, :user_id,:level,lesson_ratings_attributes:[:id,:communication,:quality,:teaching,:general_grade,:lesson_id,:user_id,:avg,:_destroy],uploads_attributes: [:id, :upload, :_destroy],comments_attributes: [:id, :comment,:user_id,:lesson_id, :_destroy])
  end

  def find_lesson
    @lesson = Lesson.friendly.find(params[:id])
  end
end
