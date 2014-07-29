require 'action_controller'

class UsersController < ActionController::Base

  before_filter :set_current_user
  before_filter :set_vestal_versions_request_info

  private

  def set_current_user
    User.create(:name => 'Avdi Grimm')
  end
end

class ProfilesController < ActionController::Base

  before_filter :set_current_profile
  before_filter :set_vestal_versions_request_info

  private

  def set_current_profile
    User.create(:name => 'Avdi Grimm')
  end
end
