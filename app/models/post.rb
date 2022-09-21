class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def user_counter_updater
    total_posts = User.find_by(User_id).posts_counter
    User.find_by(User_id).update(posts_counter: total_posts + 1)
  end

  def most_recent_comments
    comments.where(Post_id: self).order('created_at DESC').limit(5)
  end
end
