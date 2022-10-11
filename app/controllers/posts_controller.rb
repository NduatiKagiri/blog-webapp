class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.includes(comments: [:author]).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    author = current_user
    post = Post.new(params.require(:post).permit(:title, :text))
    post.author = author
    post.save
    redirect_to user_posts_path(author)
  end
end
