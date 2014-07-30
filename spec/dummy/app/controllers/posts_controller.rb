class PostsController < ApplicationController
  before_filter :set_current_user

  # VestalVersions before filter
  before_filter :set_vestal_versions_request_info

  def update
    post = @current_user.posts.find(params[:id])
    post.title = 'Title After'
    post.save

    render nothing: true
  end

  private

  def set_current_user
    @current_user = User.find(params[:user_id])
  end

  # Override VestalVersions `user_for_vestal_versions`
  def user_for_vestal_versions
    @current_user
  end
end
