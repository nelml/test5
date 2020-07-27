class BooksController < ApplicationController
  def index
  	@books = Book.all
  	# @user = User.find(params[:id])
  end

  def new
  end

  def edit
  end
end
