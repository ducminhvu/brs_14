class Admin::UsersController < ApplicationController
  before_action :required_admin
  before_action :find_user, only: [:edit, :update, :destroy]
  
  def index
    @users = User.paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "admin.create_success"
      redirect_to admin_users_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "admin.update_success"
      redirect_to admin_users_path
    else
      render "edit"
    end
  end

  def destroy
    if @user.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def user_params
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete :password
      params[:user].delete :password_confirmation
    end
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :picture
  end

  def find_user
    @user = User.find params[:id]
  end
end
