class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
      @comment = Comment.new(comment_params)
      if @comment.save
        ActionCable.server.broadcast "comment_channel", {comment: @comment, user: @comment.user}
        end
      end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
