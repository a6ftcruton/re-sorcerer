class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Your post has been shared."
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    post = Post.find(params[:id])
    post.update_attribute(params[:votes], (post.votes += 1))
      # redirect_to root_path
  end

  def upvote
    post = Post.find(params[:id])
    post.upvote
    redirect_to root_path # change this to an ajax call
  end

  private

    def post_params
      params.require(:post).permit(:title, :url)
    end
end
