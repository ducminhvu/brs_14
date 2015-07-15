class LikesController < ApplicationController
  def create
    @activity = Activity.find_by id: params[:activity_id]
    like = Like.new user_id: current_user.id, activity_id: @activity.id
    if like.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @activity = Activity.find_by id: params[:activity_id]
    like = Like.find_by id: params[:id]
    if like.destroy
      respond_to do |format|
        format.js
      end
    end
  end
end
