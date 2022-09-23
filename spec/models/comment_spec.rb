require 'rails_helper'

RSpec.describe Comment, type: :model do
  first_post = Post.create(title: 'Post 1', author: User.create(name: 'John'))
  second_user = User.create(name: 'Nduati')

  subject { Comment.create(text: 'Comment 1', author: second_user, post: first_post) }

  before { subject.save }

  it 'update_comments_counter increments comments_counter' do
    expect(subject.post.comments_counter).to be 1
    Comment.create(text: 'Comment 2', author: subject.author, Post_id: subject.author)
    expect(subject.post.comments_counter).to be 2
  end
end
