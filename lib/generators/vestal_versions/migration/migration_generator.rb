require 'generators/vestal_versions'
require 'rails/generators/active_record'

module VestalVersions
  module Generators
    class MigrationGenerator < ActiveRecord::Generators::Base
      extend Base

      argument :name, :type => :string, :default => 'create_vestal_versions'

      def generate_files
        migration_template 'migration.rb', "db/migrate/#{name}.rb"
        migration_template 'add_request_info_to_versions.rb', 'db/migrate/add_request_info_to_versions.rb'
        template 'initializer.rb', 'config/initializers/vestal_versions.rb'
      end
    end
  end
end
