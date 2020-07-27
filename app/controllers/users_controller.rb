class UsersController < ApplicationController

	def show

	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path, notice: "You have updated user successfully."

	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction)
	end

end