class User::UsersController < ApplicationController
  
before_action :find_user,only: [:edit,:update,:show]
  def index
    @comments = current_user.lessons.last.try(:comments)
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in :user, @user
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_user_path
    else
      redirect_to user_user_path
    end
  end

  def destroy
  end

  private
  def user_params
    params[:user].permit(:first_name,:last_name,:email,:bio,:role_id,:password,:password_confirmation,images_attributes: [:id, :upload, :_destroy])
  end
  def find_user
    
    @user = User.friendly.find(current_user.id)
   
  end

end
