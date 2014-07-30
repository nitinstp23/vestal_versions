class AddRequestInfoToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :ip_address, :string
    add_column :versions, :user_agent, :string
    add_column :versions, :request_url, :string
  end
end
