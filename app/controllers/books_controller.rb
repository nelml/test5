class BooksController < ApplicationController
  before_action :authenticate_user!, only:[:index, :edit, :show]
  def about
  end

  def index
  	@book = Book.new
  	@books = Book.all
  	# @user = User.find(params[:id])
    # @users = User.all
    @user = @book.user
  end

  def new
  end

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
    if @user == current_user

    else
      redirect_to books_path
    end

  end

  def show
    #@book = Book.find(params[:id])
    @booky = Book.find(params[:id])
    @user = @booky.user
    @book = Book.new
    #@ss = ""
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     redirect_to book_path(@book.id), notice: 'You have created book successfully.'

    elsif request.referer&.include?("/books/")
      path = Rails.application.routes.recognize_path(request.referer)
      idcre = request.referer
      idcre.gsub!("http://localhost:3000/books/","")
      idcre.to_i
      @booky = Book.find(idcre)
      @user = @booky.user
      render action: path[:action]


    elsif request.referer&.include?("/books")
      @books = Book.all
      path = Rails.application.routes.recognize_path(request.referer)
      render action: path[:action]

    elsif request.referer&.include?("/users/")
      @books = Book.all
      @user = @book.user
      render 'index'

    else
      path = Rails.application.routes.recognize_path(request.referer)
      render action: path[:action]
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.user.id = current_user.id
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render action: :edit
    end
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end