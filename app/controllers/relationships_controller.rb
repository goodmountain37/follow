class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    following = current_user.follow(user)
    redirect_back fallback_location: user_path(user)
  end

  def destroy
    user = User.find(params[:user_id])
    following = current_user.unfollow(user)
    following.destroy
    redirect_back fallback_location: user_path(user)
  end

  def followings_index
    @users = User.find(params[:user_id]).followings
  end

  def followers_index
    @users = User.find(params[:user_id]).followers
  end
end
