class User < ApplicationRecord
  has_many :posts, foreign_key: 'User_id'
  has_many :comments, foreign_key: 'User_id'
  has_many :likes, foreign_key: 'User_id'

  def recent_posts
    posts.where(User_id: self).order('created_at DESC').limit(3)
  end
end
