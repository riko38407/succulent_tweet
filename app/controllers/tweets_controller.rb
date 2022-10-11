class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tweets = Tweet.includes(:user).limit(12)
   
  end

  def new
    @tweet = Tweet.new
    @tweet = Tweet.find(params[:id])
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
