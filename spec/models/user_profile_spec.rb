require 'spec_helper'

describe UserProfile do

  before :each do
    @user = User.new email: 'test@test.com', password: '12341234', name: 'test'
    @user.user_profile = UserProfile.new first_name: 'First Name', last_name: 'Last Name', gsm: '05065051020'
    @user.save
    @user_profile = @user.user_profile
  end

  describe User do
    it { should belong_to(:user) }
    it 'user has one profile' do
      t = User.reflect_on_association(:user_profile)
      t.macro.should == :has_one
    end
    it 'user profile belongs to user' do
      t = UserProfile.reflect_on_association(:user)
      t.macro.should == :belongs_to
    end
  end

  describe '#new' do
    it 'user must be have a user_profile' do
      @user.user_profile.should_not be_nil
    end
    it 'user_profile must be have a user' do
      @user_profile.user.should_not be_nil
    end
  end

  describe '#first_name' do
    it 'returns the correct first name' do
        @user.user_profile.first_name.should eql 'First Name'
    end
  end

  describe '#last_name' do
    it 'returns the correct last name' do
      @user.user_profile.last_name.should eql 'Last Name'
    end
  end

  describe '#gsm' do
    it 'returns the correct gsm' do
      @user.user_profile.gsm.should eql '05065051020'
    end
  end

end
