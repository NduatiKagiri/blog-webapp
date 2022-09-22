class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def user_counter_updater
    user.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.where(Post_id: self).order('created_at DESC').limit(5)
  end
end
