class PostsController < ApplicationController

  def index
    @posts = Post.sort_by_rank
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
      # redirect_to root_path
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote
    respond_to do |format|
      format.html { redirect_to @post } 
      format.js # render posts/upvote.js.erb
    end
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote
    respond_to do |format|
      format.html { redirect_to @post }
      format.js # render posts/downvote.js.erb
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :url)
    end
end
