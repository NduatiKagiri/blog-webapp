require 'rails_helper'

describe 'validations' do
  subject { Post.create(title: 'Post One', text: 'Text 1', author: User.new(name: 'John')) }

  before { subject.save }

  it { should validate_presence_of(:title) }

  it { should validate_length_of(:title).is_at_most(250) }

  it 'Comments counter should be equal to or greater than 0' do
    expect(subject.comments_counter).to be >= 0
    subject.comments_counter = -3
    expect(subject).to_not be_valid
    subject.comments_counter = 5
    expect(subject).to be_valid
  end

  it 'Likes counter should be equal to or greater than 0' do
    expect(subject.likes_counter).to be >= 0
    subject.likes_counter = -3
    expect(subject).to_not be_valid
    subject.likes_counter = 5
    expect(subject).to be_valid
  end

  it 'user_counter_updater to increase with increase in posts' do
    expect(subject.author.posts_counter).to be 1
    Post.create(title: 'Post 2', author: subject.author)
    expect(subject.author.posts_counter).to be 2
  end

  it 'Five most recent comments length should be between 0 and 5' do
    expect(subject.most_recent_comments).to be_kind_of Array
    expect(subject.most_recent_comments.length).to be_between(0, 5)
  end
end
