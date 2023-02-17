require 'rails_helper'

RSpec.describe 'Groups', type: :system do
  describe 'show page' do
    before(:each) do
      @user = User.create(name: 'Tom', email: 'tom@email.com', password: 'password')
      @group = Group.create(name: 'Group 1', icon: 'https://www.svgrepo.com/show/503909/clip.svg', author_id: @user.id)
      @budget = Budget.create(name: 'Budget 1', amount: 200, author_id: @user.id, group_id: @group.id)
      visit new_user_session_path
      fill_in 'Email', with: 'tom@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      sleep(1)
      visit group_path(@group.id)
    end

    it 'should display the name of the budget created' do
      expect(page).to have_content(@budget.name)
    end

    it 'should display the amount if the budget created' do
      expect(page).to have_content(@budget.amount)
    end

    it 'should direct to a form to add new transaction' do
      click_on 'Add a new transaction'
      expect(page).to have_current_path new_budget_path
    end
  end
end
