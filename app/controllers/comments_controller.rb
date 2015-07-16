class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @review = Review.find params[:review_id]
    @comment = @review.comments.build comment_params
    @comment.user = current_user 
    respond_to do |format|
      if @comment.save
        format.js
      else
        redirect_to :back
      end
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = t "review_deleted"
    redirect_to :back
  end
  
  private
  def comment_params
    params.require(:comment).permit :content
  end
end
