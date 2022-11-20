class RelationshipsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def create
    following = current_user.relationships.build(follower_id: params[:user_id])
    following.save
    redirect_to request.referrer || root_path
  end

  def destroy
    reverse_of_relationships.find_by(following_id: user.id).present?
    following.destroy
    redirect_to request.referrer || root_path
    end

    def followings
      user = User.find(params[:id])
      @users = user.followings
    end
  
    def followers
      user = User.find(params[:id])
      @users = user.followers
    end
  end

