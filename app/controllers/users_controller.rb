class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@books = @user.books
		@book = Book.new
	end

	def create
		@book = Book.new
		@book.user_id = current_user.id
		@book.save
		redirect_to book_path(@book.id)
	end

	def edit
		@user = current_user
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path, notice: "You have updated user successfully."
	end

	def index
		@book = Book.new
		@user = current_user
		@users = User.all
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :image)
	end

end