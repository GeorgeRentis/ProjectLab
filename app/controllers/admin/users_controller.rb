class Admin::UsersController < Admin::AdminController
  before_action :find_user,only:[:edit,:update,:destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(admin_user_params)
    if @user.save
      flash[:success] = "User Successfully added"
      redirect_to admin_users_path
    else
      flash[:danger] = "Cannot create."
      redirect_to new_admin_user_path
    end
  end

  def edit
  end

  def update
    if @user.update(admin_user_params)
      flash[:success] = "User Successfully edited"
      redirect_to admin_users_path
    else
      flash[:danger] = "Cannot edit."
      redirect_to admin_users_path
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "User Successfully destoryed"
      redirect_to admin_users_path
    else
      flash[:danger] = "Cannot destroy."
      redirect_to admin_users_path
    end
  end

  private
  def admin_user_params
    params[:user].permit(:email,:first_name,:last_name,:bio,:password,:password_confirmation,:role_id,images_attributes: [:id, :upload, :_destroy])
  end

  def find_user
    @user = User.friendly.find(params[:id])
  end
end
