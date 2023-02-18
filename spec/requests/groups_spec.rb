require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  describe 'GET groups_path' do
    include Devise::Test::IntegrationHelpers

    let(:user) { User.create(name: 'Tom', email: 'tom@email.com', password: 'password') }
    before do
      sign_in user
      get groups_path
    end

    it 'Should return 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'Should render the correct template' do
      expect(response).to render_template(:index)
    end

    it 'should render the correct text in the template' do
      expect(response.body).to include 'All Categories'
    end
  end

  describe 'GET group_path' do
    include Devise::Test::IntegrationHelpers

    let(:user) { User.create(name: 'Tom', email: 'tom@email.com', password: 'password') }
    let(:group) { Group.create(name: 'Group 1', icon: 'https://www.svgrepo.com/show/503909/clip.svg', author_id: user.id) }
    before do
      sign_in user
      get group_path(group.id)
    end

    it 'Should return 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'Should render the correct template' do
      expect(response).to render_template(:show)
    end

    it 'should render the correct text in the template' do
      expect(response.body).to include 'TRANSACTION'
    end
  end
end
