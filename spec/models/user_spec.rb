require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John') }

  before { subject.save }

  it 'name should be there' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Posts counter should be equal to or greater than 0' do
    expect(subject.posts_counter).to be >= 0
    subject.posts_counter = -3
    expect(subject).to_not be_valid
    subject.posts_counter = 5
    expect(subject).to be_valid
  end

  it 'User recent posts should be between 0 and 3' do
    expect(subject.recent_posts).to be_kind_of Array
    expect(subject.recent_posts.length).to be_between(0, 3)
  end
end
