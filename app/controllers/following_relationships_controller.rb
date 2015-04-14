class FollowingRelationshipsController < ApplicationController
  before_action :require_login

  def create
    if current_user.id == user.id
      redirect_to profile_path(user)
    end

    current_user.follow user
    redirect_to profile_path(user), notice: "Now following"
  end

  def destroy
    current_user.unfollow user
    redirect_to profile_path(user), notice: "Unfollowed"
  end

  private
  
  def user
    @_user ||= User.find_by(id: params[:user_id])
  end
end
