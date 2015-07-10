class BooksController < ApplicationController
  def index
    @books = Book.paginate page: params[:page], per_page: Settings.length.page
  end

  def show
    @book = Book.find params[:id]
    @review = @book.reviews.build
    @reviews = @book.reviews.paginate page: params[:page], per_page: Settings.length.page
  end
end
