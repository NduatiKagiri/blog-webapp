require 'rails_helper'

describe 'validations' do
  first_post = Post.create(title: 'Post 1', author: User.create(name: 'John'))
  second_user = User.create(name: 'Nduati')
  subject { Like.create(author: second_user, post: first_post) }

  before { subject.save }

  it 'update_likes_counter increments likes_counter' do
    expect(subject.post.likes_counter).to be 1
    Like.create(author: subject.post.author, post: subject.post)
    expect(subject.post.likes_counter).to be 2
  end
end
