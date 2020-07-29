class BooksController < ApplicationController
  def index
  	@book = Book.new
  	@books = Book.all
  	# @user = User.find(params[:id])
    @users = User.all
    @user = @book.user
  end

  def new
  end

  def edit
  end

  def show
    #@book = Book.find(params[:id])
    @booky = Book.find(params[:id])
    @user = @booky.user
    @book = Book.new
    #@ss = ""

  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    # if book.save
     redirect_to book_path(book.id), notice: 'aaa'
    # else
      # path = Rails.application.routes.recognize_path(request.referer)
      # render path[:action]
    # end
  end

  def update
  end

  def delete
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
