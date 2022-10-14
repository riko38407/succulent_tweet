class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @tweets = Tweet.all.order('created_at DESC')
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @tweet.destroy
  end

  def show
    @comments = @tweet.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
  end
  

  def update
    @comments = @tweet.comments.includes(:user)
    @comment = Comment.new
    if @tweet.update(tweet_params)
      render 'show'
    else
      render 'edit'
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :text, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def contributor_confirmation
    if user_signed_in? && current_user.id == @tweet.user_id

    else
      redirect_to root_path
    end
  end
end
