class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find_by id: params[:user_id]
    @books = @user.favorited_books.paginate page: params[:page]
  end

  def create
    @book = Book.find_by id: params[:book_id]
    @favorite = Favorite.new favorite_params
    if @favorite.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    favorite = Favorite.find_by id: params[:id]
    @book = favorite.book
    if favorite.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def favorite_params
    params.permit :user_id, :book_id
  end
end
