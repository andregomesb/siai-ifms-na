class PermissionController < ApplicationController
  def index
    @permissions = Permission.where(user_id: params[:user_id]).page(params[:page])
  end

  def new
    @permission = Permission.new
    @permission.user_id = params[:user_id]
  end
end
