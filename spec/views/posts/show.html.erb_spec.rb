require 'rails_helper'
RSpec.feature 'Test Post show', type: :feature do
  before :each do
    @user = User.create(name: 'John',
                        photo: 'https://example.com/myimage.png',
                        bio: 'Student at Microverse.')
    @user2 = User.create(name: 'Brenda',
                        photo: 'https://example.com/myimage.png',
                        bio: 'Student at Microverse.')
    @first_post = Post.create(author: @user, title: 'Hello 1', text: 'This is my first post')
    Comment.create(post: @first_post, author: @user2, text: 'Hi John!')
    Comment.create(post: @first_post, author: @user2, text: 'Hi John!')
    visit user_post_path(@first_post.author, @first_post)
  end
  it "I can see the post's title" do
    expect(page).to have_content(@first_post.title)
  end
  it "I can see who wrote the post" do
    expect(page).to have_content(@user.name)
  end
  it "I can see how many comments it has" do
    expect(page).to have_content('Comments: 2')
  end
  it "I can see how many likes it has" do
    expect(page).to have_content('Likes: 0')
  end
  it "I can see the post body" do
    expect(page).to have_content(@first_post.text)
  end
  it "I can see the username of each commentor" do
    expect(page).to have_content(@user2.name)
  end
  it "I can see the comment each commentor left" do
    expect(page).to have_content('Hi John!')
  end
end