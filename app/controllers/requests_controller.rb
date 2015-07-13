class RequestsController < ApplicationController
  def index
    @requests = Request.list_request_of(current_user).sort_request
      .paginate page: params[:page], per_page: Settings.requests_per_page
    @request = Request.new
  end

  def create
    @request = Request.new request_params
    @request.save
    redirect_to :back
  end

  def destroy
    @request = Request.find params[:id]
    if @request.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def request_params
    params.require(:request).permit :book_name, :author, :description, :user_id
  end
end
