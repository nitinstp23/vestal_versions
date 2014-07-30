require 'spec_helper'

describe VestalVersions::Users do

  before do
    User.destroy_all

    @updated_by = User.create(:name => 'Steve Jobs')
    @user = User.create(:name => 'Steve Richert')
  end

  it 'defaults to nil' do
    @user.update_attributes(:first_name => 'Stephen')
    @user.versions.last.user.should be_nil
  end

  it 'accepts and returns an ActiveRecord user' do
    @user.update_attributes(:first_name => 'Stephen', :updated_by => @updated_by)
    @user.versions.last.user.should == @updated_by
  end

  it 'accepts and returns a string user name' do
    @user.update_attributes(:first_name => 'Stephen', :updated_by => @updated_by.name)
    @user.versions.last.user.should == @updated_by.name
  end

end
