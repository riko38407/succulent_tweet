class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_prototype, except: [ :new, :destroy, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

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

def edit
    unless user_signed_in?
      redirect_to action: :edit
    end
  end

  def update
    if @tweet.update(tweet_params)
     redirect_to tweet_path(@tweet)
     else
    
     render :edit
     end
   
   end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :text, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @tweet.user
  end
end
