class LikesController < ApplicationController
  def create
    @like = current_user.likes.new
    @like.post_id = params[:post_id]
    redirect_to user_post_path(current_user, @like.post) if @like.save
  end
end
