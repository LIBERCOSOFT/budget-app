require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', email: 'tom@email.com', password: 'password') }
  before { subject.save }

  context 'When testing provided values before creating a user' do
    it 'should have a name provided' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'should have an email provided' do
      subject.email = ''
      expect(subject).to_not be_valid
    end

    it 'should a valid name' do
      subject.name = 'Tom'
      expect(subject).to be_valid
    end

    it 'should have a valid email' do
      subject.email = 'tom@email.com'
      expect(subject).to be_valid
    end

    it 'should have a password provided' do
      subject.password = ''
      expect(subject).to_not be_valid
    end

    it 'should a valid password' do
      subject.password = 'password'
      expect(subject).to be_valid
    end
  end
end
