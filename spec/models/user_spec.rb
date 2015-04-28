require 'spec_helper'

describe User do

  before :each do
    @user = User.new email: 'test@test.com', password: '12341234', name: 'test'
  end

  describe '#new' do
    it 'takes two parameters an returns  a User object' do
      @user.should be_an_instance_of User
    end
  end

  describe '#email' do
    it 'returns the correct email' do
      @user.email.should eql 'test@test.com'
    end
  end

  describe '#password' do
    it 'returns the correct password' do
      @user.password.should eql '12341234'
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      @user.name.should eql 'test'
    end
  end

end

