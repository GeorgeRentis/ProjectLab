class Admin::CategoriesController < Admin::AdminController
  before_action :find_category,only: [:edit,:update,:show]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
  end

  def create
    @category = Category.new(admin_category_params)
    if @category.save
      flash[:success] = "Category Successfully added"
      redirect_to admin_categories_path
    else
      flash[:danger] = "Cannot create."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(admin_category_params)
      flash[:success] = "Category Successfully edited"
      redirect_to admin_categories_path
    else
      flash[:danger] = "Cannot edit."
      redirect_to admin_categories_path
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = "Category Successfully destoryed"
      redirect_to admin_categories_path
    else
      flash[:danger] = "Cannot destroy."
      redirect_to admin_categories_path
    end
  end

  private
    def admin_category_params
      params[:category].permit(:name,:image_url)
    end

    def find_category
      @category = Category.find(params[:id])
    end

end
