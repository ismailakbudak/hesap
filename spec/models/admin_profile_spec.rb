require 'spec_helper'

describe AdminProfile do

  before :each do
    @admin = Admin.new email: 'test@test.com', password: '12341234'
    @admin.admin_profile = AdminProfile.new first_name: 'First Name', last_name: 'Last Name', gsm: '05065051020'
    @admin.save
    @admin_profile = @admin.admin_profile
  end

  describe Admin do
    it { should belong_to(:admin) }
    it 'admin has one profile' do
      t = Admin.reflect_on_association(:admin_profile)
      t.macro.should == :has_one
    end
    it 'admin profile belongs to admin' do
      t = AdminProfile.reflect_on_association(:admin)
      t.macro.should == :belongs_to
    end
  end

  describe '#new' do
    it 'admin must be have a admin_profile' do
      @admin.admin_profile.should_not be_nil
    end
    it 'admin_profile must be have a admin' do
      @admin_profile.admin.should_not be_nil
    end
  end

  describe '#first_name' do
    it 'returns the correct first name' do
      @admin.admin_profile.first_name.should eql 'First Name'
    end
  end

  describe '#last_name' do
    it 'returns the correct last name' do
      @admin.admin_profile.last_name.should eql 'Last Name'
    end
  end

  describe '#gsm' do
    it 'returns the correct gsm' do
      @admin.admin_profile.gsm.should eql '05065051020'
    end
  end

end
