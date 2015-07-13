class RequestsController < ApplicationController
  def index
    @requests = Request.list_request_of(current_user).sort_request.paginate page: params[:page],
      per_page: Settings.requests_per_page
  end

  def destroy
    @request = Request.find params[:id]
    if @request.destroy
      respond_to do |format|
        format.js
      end
    end
  end
end
