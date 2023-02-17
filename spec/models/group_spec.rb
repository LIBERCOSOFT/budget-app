require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @user = User.create(name: 'Tom', email: 'tom@email.com', password: 'password')
    @group = Group.create(name: 'Group 1', icon: 'https://www.svgrepo.com/show/503909/clip.svg', author_id: @user.id)
  end

  context 'When testing provided values before creating a user' do
    it 'should have a name provided' do
      @group.name = ''
      expect(@group).to_not be_valid
    end

    it 'should have an icon url provided' do
      @group.icon = ''
      expect(@group).to_not be_valid
    end

    it 'should a valid name' do
      @group.name = 'Group 1'
      expect(@group).to be_valid
    end

    it 'should have a valid icon url' do
      @group.icon = 'https://www.svgrepo.com/show/503909/clip.svg'
      expect(@group).to be_valid
    end

    it 'should have a valid author id' do
      @group.author = @user
      expect(@group).to be_valid
    end
  end
end
