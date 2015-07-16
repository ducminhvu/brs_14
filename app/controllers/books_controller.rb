class BooksController < ApplicationController
  def index
    @categories = Category.all
    books = params[:favorites].present? ? current_user.favorited_books : Book.all
    @q = books.ransack params[:query]
    @books = @q.result.paginate page: params[:page], per_page: Settings.length.page_book
  end

  def show
    @book = Book.find params[:id]
    @review = @book.reviews.build
    @comment = Comment.new
    @reviews = @book.reviews.paginate page: params[:page], per_page: Settings.length.page
    @reading = Reading.find_by book_id: @book.id, user_id: current_user.id
  end
end
