class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :user_counter_updater

  def most_recent_comments
    comments.where(post_id: self).order('created_at DESC').limit(5)
  end

  private

  def user_counter_updater
    author.increment!(:posts_counter)
  end
end
