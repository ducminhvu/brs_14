class Admin::BooksController < ApplicationController
  before_action :get_categories, only: [:new, :create, :edit]

  def index
    @books = Book.paginate page: params[:page], per_page: Settings.length.page
  end

  def show
    @book = Book.find params[:id]
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      redirect_to [:admin, @book], notice: t("admin.book.create_success")
    else
      render "new"
    end
  end

  def edit
    @book = Book.find params[:id]
  end

  def update
    @book = Book.new book_params
    if @book.update_attributes book_params
      redirect_to [:admin, @book], notice: t("admin.book.update_success")
    else
    render "edit"
    end
  end

  def destroy
    @book = Book.new book_params
    if @book.destroy
      flash[:success] = t "admin.book.delete_success"
    else
      flash[:danger] = t "admin.book.delete_failed"
    end
    redirect_to admin_books_url
  end

  private
  def get_categories
    @categories = Category.all
  end

  def book_params
    params.require(:book).permit :title, :publish_date, :category_id,
      :author, :number_page, :description, :picture
  end
end
