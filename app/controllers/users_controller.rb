class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @user = User.find(params[:id])
    @name = user.name
    @tweets = user.tweets
    @tweet = Tweet.find_by(params[:id])
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
