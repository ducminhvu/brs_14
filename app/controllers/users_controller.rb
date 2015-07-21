class UsersController < ApplicationController
  def index
    @users = User.paginate page: params[:page], per_page: Settings.length.page
  end

  def show
    @user = User.find params[:id]
    @activities = @user.activities.sort_activities.paginate page: params[:page],
      per_page: Settings.length.page
  end
end
