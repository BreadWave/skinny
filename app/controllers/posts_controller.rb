class PostsController < ApplicationController
#	after_create :set_author

	def create
		@user = User.find(params[:user_id])
		@post = @user.posts.create(post_params)
#		set_author
		@post[:author] = current_user[:name]
		@post[:profile] = current_user[:profile]
		redirect_to user_path(@user)
		
	end

  	def destroy
    	@user = User.find(params[:user_id])
    	@post = @user.posts.find(params[:id])
    	@post.destroy
    	redirect_to user_path(@user)
  	
  	end

	private

	def post_params
		params.require(:post).permit(:author, :profile, :content, :photo)
	end

#	def set_author
#		@autor = User.all
#		@author = @autor.find(params[:user_id])
#		@post[:author] = current_user[:name]
#		@post[:profile] = current_user[:profile]
#	end

end
