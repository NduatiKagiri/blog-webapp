require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(name: 'John')
    @id = @user.id
  end

  describe 'GET /users/:id/posts/' do
    before(:example) { get "/users/#{@id}/posts/" }

    it 'Returns request success' do
      expect(response).to have_http_status(:success)
    end

    it 'Renders the correct view' do
      expect(response).to render_template(:index)
    end

    it 'Displays the correct placeholder text' do
      expect(response.body).to include('<h1>Posts Index</h1>')
    end
  end

  describe 'GET /users/:id/posts/:id/' do
    before(:example) do
      post1 = Post.create(title: 'My Post 1', author: @user, text: 'This is post 1')
      get "/users/#{@id}/posts/#{post.id}/"
    end

    it 'Returns request success' do
      expect(response).to have_http_status(:success)
    end

    it 'Renders the correct view' do
      expect(response).to render_template(:show)
    end

    it 'Displays the correct placeholder text' do
      expect(response.body).to include('<h3>Showing Post</h3>')
    end
  end
end
