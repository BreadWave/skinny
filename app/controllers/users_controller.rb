class UsersController < ApplicationController
	

	def edit
		@user = User.find(params[:id])
	end

	def show
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
		 	redirect_to @user, notice: 'User edited'
		else
		 	render :edit
		end		

	end

	private

	def user_params
		params.require(:user).permit(:name, :about, :cover, :profile, :email, :hashtag)
	end

end
