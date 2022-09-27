require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /' do
    before(:example) { get '/' }

    it 'Returns request success' do
      expect(response).to have_http_status(:success)
    end

    it 'Renders the correct view' do
      expect(response).to render_template(:index)
    end

    it 'Displays the correct placeholder text' do
      expect(response.body).to include('<h1>Homepage</h1>')
    end
  end

  describe 'GET users/:id/' do
    before(:example) do
      user = User.create(name: 'John')
      get "/users/#{user.id}/"
    end

    it 'Returns request success' do
      expect(response).to have_http_status(:success)
    end

    it 'Renders the correct view' do
      expect(response).to render_template(:show)
    end

    it 'Displays the correct placeholder text' do
      expect(response.body).to include('<h3>Showing user</h3>')
    end
  end
end
