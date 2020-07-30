class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@books = @user.books
		@book = Book.new
	end

	def create
		render template: 'books/create'
		# @book = Book.new
		# @book.user_id = current_user.id
		# if @book.save
		# 	redirect_to book_path(@book.id), notice: "You have creatad book successfully."
	 #    else
	 #    	@books = Book.all
	 #    	@user = @books.user
	 #    	render books_path
	 #    end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path, notice: "You have updated user successfully."
	end

	def index
		@book = Book.new
		@users = User.all
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :image)
	end

	def book_params
		params.require(:book).permit(:title, :body)
	end

end