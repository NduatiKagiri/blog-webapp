require 'rails_helper'
RSpec.feature 'User Posts Index Page', type: :feature do
  before :each do
    @user = User.create(name: 'John',
                        photo: 'https://example.com/myimage.png',
                        bio: 'Student at Microverse.')
    @user2 = User.create(name: 'Dario',
                        photo: 'https://example.com/myimage.png',
                        bio: 'Student at Microverse.')
    @first_post = Post.create(author: @user, title: 'Hello 1', text: 'This is my first post')
    5.times do |_i|
      Comment.create(post: @first_post, author: @user2, text: 'Hi John!')
    end
    visit user_posts_path(@user)
  end
  it "I can see the user's profile picture" do
    expect(page).to have_selector('img')
  end
  it "I can see the user's username" do
    expect(page).to have_content(@user.name)
  end