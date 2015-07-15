class ReviewsController < ApplicationController
  after_action :average_rate, only: :create
  def create
    @review = current_user.reviews.build review_params
    @review.book_id = params[:book_id]
    if @review.save
      flash[:success] = t "review_created"
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    flash[:success] = t "review_deleted"
    redirect_to :back
  end

  private
  def average_rate
    book = Book.find params[:book_id]
    book.update_attributes rating: Review.average_rated(book)
  end

  def review_params
    params.require(:review).permit :content, :rating, :thesis_statement 
  end
end
