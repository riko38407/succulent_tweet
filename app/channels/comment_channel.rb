class CommentChannel < ApplicationCable::Channel
  def subscribed
    @tweet = Item.find(params[:tweet_id])
    stream_for @tweet
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
