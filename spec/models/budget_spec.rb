require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @user = User.create(name: 'Tom', email: 'tom@email.com', password: 'password')
    @group = Group.create(name: 'Group 1', icon: 'https://www.svgrepo.com/show/503909/clip.svg', author_id: @user.id)
    @budget = Budget.create(name: 'Budget 1', amount: 200, author_id: @user.id, group_id: @group.id)
  end

  context 'When testing provided values before creating a user' do
    it 'should have a name provided' do
      @budget.name = ''
      expect(@budget).to_not be_valid
    end

    it 'should have an amount provided' do
      @budget.amount = ''
      expect(@budget).to_not be_valid
    end

    it 'should a valid name' do
      @budget.name = 'Budget 1'
      expect(@budget).to be_valid
    end

    it 'should have a valid icon url' do
      @budget.amount = 200
      expect(@budget).to be_valid
    end

    it 'should have a valid author id' do
      @budget.author_id = @user.id
      expect(@budget).to be_valid
    end

    it 'should have a valid group id' do
      @budget.group_id = @group.id
      expect(@budget).to be_valid
    end
  end
end
