require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts/' do
    before(:example) { get '/posts/' }

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

  describe 'GET /posts/show/' do
    before(:example) { get '/posts/show/' }

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
