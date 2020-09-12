class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user, only: :destroy

  def index
    @users = User.all.order(id: "DESC")
  end

  def destroy
    User.find_by(id: params[:id]).destroy
    redirect_to users_index_path
  end
end
