class Admin::RequestsController < ApplicationController
  before_action :required_admin
  before_action :set_request, only: [:show, :destroy, :update]

  def index
    @requests = Request.list_request.paginate page: params[:page]
  end

  def show
  end

  def update
    @request.bought = true
    if @request.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    if @request.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def set_request
    @request = Request.find params[:id]
  end
end
