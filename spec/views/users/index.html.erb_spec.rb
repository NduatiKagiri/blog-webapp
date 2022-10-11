require 'rails_helper'

RSpec.feature 'Home Page', type: :feature do
  before :each do
    @user = User.create(name: 'John',
                        photo: 'http://example.com/myimage.png',
                        bio: 'Student at Microverse.')

    visit root_path
  end

  it 'I can see the username of all other users' do
    expect(page).to have_content('John')
  end

  it 'I can see the profile picture for each user' do
    expect(page).to have_selector('img')
  end

  it 'I can see the number of posts each user has written' do
    expect(page).to have_content('Number of Posts: 0')
  end

  it "When I click on a user, I am redirected to that user's show page" do
    visit(user_path(@user.id))
    expect(page).to have_content('Bio')
  end
end
