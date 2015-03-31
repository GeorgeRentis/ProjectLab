class Admin::AdminController < ApplicationController
  layout 'admin'
 before_action :check_admin

  def index
  end

  private
    def check_admin
      unless current_user && current_user.role_id == "admin"
        redirect_to admin_root_path
      end

    end


end
