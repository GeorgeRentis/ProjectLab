class UsersController < ApplicationController
  def index
  end

  def show

    @user = User.where(slug:  params[:id])

  end

  def edit
  end

  def update
  end
end
