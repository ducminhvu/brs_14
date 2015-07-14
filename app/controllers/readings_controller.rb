class ReadingsController < ApplicationController
  def index
    @readings = Book.reading current_user
  end
end
