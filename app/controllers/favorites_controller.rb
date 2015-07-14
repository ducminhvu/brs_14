class FavoritesController < ApplicationController
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
