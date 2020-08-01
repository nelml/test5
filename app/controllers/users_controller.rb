class UsersController < ApplicationController
	before_action :authenticate_user!, only:[:index, :edit, :show]
	before_action :defcheck, only:[:edit]
	def defcheck
		@user = User.find(params[:id])
		if @user.id == current_user.id

		elsif current_user.nil?
			redirect_to neW_user_session_path

		else
			redirect_to user_path(current_user.id)
		end
	end
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
		if @user.update(user_params)
			redirect_to user_path, notice: "You have updated user successfully."
		else
			render "edit"
		end
	end

	def index
		@book = Book.new
		@users = User.all
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

	def book_params
		params.require(:book).permit(:title, :body)
	end

end