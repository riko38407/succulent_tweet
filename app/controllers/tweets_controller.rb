class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tweet, except: [ :index, :new, :create]
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
      render :new
    end
  end
  
  def destroy
    @tweet.destroy
  end

  def show
  end

def edit
  unless user_signed_in?
    redirect_to action: :edit
  end
end

  def update
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
    redirect_to root_path unless current_user == @tweet.user
  end
end
