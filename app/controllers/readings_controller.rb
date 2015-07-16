class ReadingsController < ApplicationController
  def index
    @readings = current_user.reading_books
  end
end
