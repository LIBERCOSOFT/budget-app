require 'rails_helper'

RSpec.describe 'Groups', type: :system do
  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'Tom', email: 'tom@email.com', password: 'password')
      @group = Group.create(name: 'Group 1', icon: 'https://www.svgrepo.com/show/503909/clip.svg', author_id: @user.id)
      visit new_user_session_path
      fill_in 'Email', with: 'tom@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      sleep(1)
      visit groups_path
    end

    it 'should display the name of the group created' do
      expect(page).to have_content(@group.name)
    end

    it 'should have the link to the icon created' do
      expect(page).to have_css("img[src='https://www.svgrepo.com/show/503909/clip.svg']")
    end

    it 'should direct to a form to add new category' do
      click_link 'Add a new category'
      expect("#{page.current_url}/new").to match new_group_path
    end
  end
end
