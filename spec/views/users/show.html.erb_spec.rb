require 'rails_helper'

RSpec.feature 'User Show Page', type: :feature do
  before :each do
    @user = User.create(name: 'John',
                        photo: 'https://example.com/myimage.png',
                        bio: 'Student at Microverse.')
    @user2 = User.create(name: 'Brenda',
                         photo: 'https://example.com/myimage.png',
                         bio: 'Student at Microverse.')
    @first_post = Post.create(author: @user, title: 'Hello 1', text: 'This is my first post')
    @second_post = Post.create(author: @user, title: 'Hello 2', text: 'This is my second post')
    @third_post = Post.create(author: @user, title: 'Hello 3', text: 'This is my third post')
    @fourth_post = Post.create(author: @user, title: 'Hello 4', text: 'This is my fourth post')
    5.times do |_i|
      Comment.create(post: @first_post, author: @user2, text: 'Hi John!')
    end

    visit user_path(@user.id)
  end

  it "I can see the user's profile picture" do
    expect(page).to have_selector('img')
  end

  it "I can see the user's username" do
    expect(page).to have_content('John')
  end

  it 'I can see the number of posts the user has written' do
    expect(page).to have_content('Number of Posts: 4')
  end

  it "I can see the user's bio" do
    expect(page).to have_content('Bio')
  end
end

RSpec.feature 'User Show Page', type: :feature do
  before :each do
    @user = User.create(name: 'John',
                        photo: 'https://example.com/myimage.png',
                        bio: 'Student at Microverse.')
    @user2 = User.create(name: 'Brenda',
                         photo: 'https://example.com/myimage.png',
                         bio: 'Student at Microverse.')
    @first_post = Post.create(author: @user, title: 'Hello 1', text: 'This is my first post')
    @second_post = Post.create(author: @user, title: 'Hello 2', text: 'This is my second post')
    @third_post = Post.create(author: @user, title: 'Hello 3', text: 'This is my third post')
    @fourth_post = Post.create(author: @user, title: 'Hello 4', text: 'This is my fourth post')
    5.times do |_i|
      Comment.create(post: @first_post, author: @user2, text: 'Hi John!')
    end

    visit user_path(@user.id)
  end

  it "I can see the user's first 3 posts" do
    expect(page).to have_content('Hello 1')
    expect(page).to have_content('Hello 2')
    expect(page).to have_content('Hello 3')
  end

  it "I can see a button that lets me view all of a user's posts" do
    expect(page).to have_content 'See All Posts'
  end
end

RSpec.feature 'User Show Page', type: :feature do
  before :each do
    @user = User.create(name: 'John',
                        photo: 'https://example.com/myimage.png',
                        bio: 'Student at Microverse.')
    @user2 = User.create(name: 'Brenda',
                         photo: 'https://example.com/myimage.png',
                         bio: 'Student at Microverse.')
    @first_post = Post.create(author: @user, title: 'Hello 1', text: 'This is my first post')
    @second_post = Post.create(author: @user, title: 'Hello 2', text: 'This is my second post')
    @third_post = Post.create(author: @user, title: 'Hello 3', text: 'This is my third post')
    @fourth_post = Post.create(author: @user, title: 'Hello 4', text: 'This is my fourth post')
    5.times do |_i|
      Comment.create(post: @first_post, author: @user2, text: 'Hi John!')
    end

    visit user_path(@user.id)
  end

  it "When I click a user's post, it redirects me to that post's show page" do
    visit(user_post_path(@user.id, @first_post.id))
    expect(page).to have_current_path user_post_path(@user.id, @first_post.id)
  end

  it "When I click to see all posts, it redirects me to the user's post's index page" do
    click_link 'See All Posts'
    expect(page).to have_current_path user_posts_path(@user)
  end
end
