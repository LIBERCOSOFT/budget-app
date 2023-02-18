require 'rails_helper'

RSpec.describe 'root', type: :request do
  describe 'GET root_path' do
    before(:each) { get root_path }

    it 'Should return 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'Should render the correct template' do
      expect(response).to render_template(:index)
    end

    it 'should render the correct text in the template' do
      expect(response.body).to include 'Budget App'
    end
  end
end
