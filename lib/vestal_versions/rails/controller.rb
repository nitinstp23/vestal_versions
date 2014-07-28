module VestalVersions
  module Controller

    def self.included(base)
      base.before_filter :set_request_info
    end

    private

    def user_for_vestal_versions
      return unless defined?(current_profile)
      current_profile
    rescue NoMethodError
      nil
    end

    # Set VestalVersion's request info.
    def set_request_info
      ::VestalVersions.vestal_versions_store[:ip]         = request.remote_ip
      ::VestalVersions.vestal_versions_store[:user]       = user_for_vestal_versions
      ::VestalVersions.vestal_versions_store[:user_agent] = request.user_agent
    end

  end

  if defined?(::ActionController)
    ::ActiveSupport.on_load(:action_controller) { include VestalVersions::Controller }
  end
end
