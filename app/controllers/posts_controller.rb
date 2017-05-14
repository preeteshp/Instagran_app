class PostsController < ApplicationController
	before_action :authenticate_user!

  def new
  	@post = Post.new
  end

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
  	@post = Post.new(permit_params)
  	if @post.save
  		flash[:success] == "Post success uploaded"
  		redirect_to post_path(@post)
  	else
  		flash[:error] == @post.error.full_messages
  		redirect_to new_post_path
  	end
  end

  private

  def permit_params
  	params.require(:post).permit(:image, :description)
  end
end
