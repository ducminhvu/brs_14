class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.paginate page: params[:page], per_page: Settings.length.page
  end

  def show
    @category = Category.find params[:id]
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
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes category_params
      redirect_to [:admin, @category], notice: t("admin.category.update_success")
    else
      render "edit"
    end
  end

  def destroy
    @category = Category.find params[:id]
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
end
