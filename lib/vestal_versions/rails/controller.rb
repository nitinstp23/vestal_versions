module VestalVersions
  module Rails
    module Controller

      # This filter needs to be executed after loading current_profile
      # Define it after the before filters which load current_profile
      # or just call it in your action.
      def set_vestal_versions_request_info
        # Set VestalVersion's request info.
        ::VestalVersions.vestal_versions_store[:user]        = user_for_vestal_versions
        ::VestalVersions.vestal_versions_store[:ip_address]  = request.remote_ip
        ::VestalVersions.vestal_versions_store[:user_agent]  = request.user_agent
        ::VestalVersions.vestal_versions_store[:request_url] = request.url
      end

      private

      def user_for_vestal_versions
        return unless defined?(current_profile)
        current_profile
      rescue NoMethodError
        nil
      end
    end
  end

  # Include Controller module to ActionController if it is defined.
  if defined?(::ActionController)
    ::ActiveSupport.on_load(:action_controller) { include VestalVersions::Rails::Controller }
  end
end
