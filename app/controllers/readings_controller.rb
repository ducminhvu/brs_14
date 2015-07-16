class ReadingsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @readings = current_user.reading_books
  end

  def create
    @book = Book.find params[:book_id]
    @reading = Reading.find_or_initialize_by book_id: @book.id, user_id: current_user.id
    @reading.status = params[:status]
    respond_to do |format|
      if @reading.save
        format.html {redirect_to @book}
        format.js
      else
        redirect_to :back
      end
    end
  end
end
