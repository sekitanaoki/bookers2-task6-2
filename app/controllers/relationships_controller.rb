class RelationshipsController < ApplicationController

  def create
    followed = User.find(params[:user_id])
    follower = User.find(current_user.id)
    relationships = Relationship.new(follower_id: follower.id)
    relationships.followed_id = followed.id
    relationships.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    followed = User.find(params[:user_id])
    follower = User.find(current_user.id)
    Relationship.find_by(follower_id: follower.id, followed_id: followed.id ).destroy
    redirect_back(fallback_location: root_path)
  end

  def followings
     user = User.find(params[:user_id])
     @users = user.followings
  end

  def followers
     user = User.find(params[:user_id])
     @users = user.followers
  end

end
