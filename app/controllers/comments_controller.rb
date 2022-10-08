class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    redirect_to user_post_path(current_user, @comment.post) if @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
