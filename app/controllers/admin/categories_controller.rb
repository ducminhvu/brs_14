class Admin::CategoriesController < ApplicationController
  before_action :required_admin
  before_action :find_category, except: [:index, :new, :create]

  def index
    @categories = Category.paginate page: params[:page],
      per_page: Settings.length.page
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to [:admin, @category], notice: t("admin.category.create_success")
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      redirect_to [:admin, @category], notice: t("admin.category.update_success")
    else
      render "edit"
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "admin.category.delete_success"
    else
      flash[:danger] = t "admin.category.delete_failed"
    end
    redirect_to admin_categories_url
  end

  private
  def category_params
    params.require(:category).permit :name, :content
  end

  def find_category
    @category = Category.find params[:id]
  end
end
