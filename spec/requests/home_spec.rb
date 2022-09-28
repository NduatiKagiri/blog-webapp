require 'rails_helper'

RSpec.describe 'Home', type: :request do
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
end
