class BooksController < ApplicationController
  def index
    @categories = Category.all
    @q = Book.ransack params[:query]
    @books = @q.result(distinct: true).paginate page: params[:page], per_page: Settings.length.page
  end

  def show
    @book = Book.find params[:id]
    @review = @book.reviews.build
    @reviews = @book.reviews.paginate page: params[:page], per_page: Settings.length.page
  end
end
