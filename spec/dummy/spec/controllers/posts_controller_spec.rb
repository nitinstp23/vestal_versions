require_relative '../spec_helper'

RSpec.describe PostsController, :type => :controller do
  describe 'PUT #update' do

    before do
      @user = User.new(name: 'Sandi Metz')
      @user.save!
      @post = @user.posts.new(title: 'Title Before')
      @post.save!
    end

    it 'creates version with request info' do
      # Settings should be blank initially.
      expect(VestalVersions.vestal_versions_store).to eq({})

      put :update, user_id: @user.id, id: @post.id

      @post.reload

      version = @post.versions.last

      expect(version.user).to        eq(VestalVersions.vestal_versions_store[:user])
      expect(version.ip_address).to  eq(VestalVersions.vestal_versions_store[:ip_address])
      expect(version.user_agent).to  eq(VestalVersions.vestal_versions_store[:user_agent])
      expect(version.request_url).to eq(VestalVersions.vestal_versions_store[:request_url])
    end

  end
end
