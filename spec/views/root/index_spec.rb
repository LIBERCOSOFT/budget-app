require 'rails_helper'

RSpec.describe 'Root', type: :system do
  describe 'index page' do
    before(:each) do
      visit root_path
    end
    it 'should direct a user to registration page' do
      click_on 'SIGN UP'
      expect(page).to have_current_path new_user_registration_path
    end

    it 'should direct a user to login page' do
      click_on 'LOG IN'
      expect(page).to have_current_path new_user_session_path
    end
  end
end
