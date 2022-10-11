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
 it "I can see the number of posts the user has written" do
    expect(page).to have_content('Number of Posts: 1')
  end
  it "I can see a post's title" do
    expect(page).to have_content(@first_post.title)
  end
  it "I can see some of the post's body" do
    expect(page).to have_content(@first_post.text)
  end
  it "I can see the first comments on a post" do
    expect(page).to have_content('Hi John!')
  end
  it "I can see how many comments a post has" do
    expect(page).to have_content("Comments: #{@first_post.comments_counter}")
  end
  it "I can see how many likes a post has" do
    expect(page).to have_content("Likes: #{@first_post.likes_counter}")
  end
  it "When I click on a post, it redirects me to that post's show page" do
    click_link(@first_post.title)
    expect(page).to have_current_path user_post_path(@user.id, @first_post.id)
  end
end