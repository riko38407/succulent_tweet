<<<<<<< Updated upstream
class CommentsController < ApplicationController
=======
class CommentsController < ApplicationController 
  before_action :authenticate_user!
>>>>>>> Stashed changes
  def create
    binding.pry
    @comment = Comment.new(comment_params)
    @tweet = Tweet.find(params[:tweet_id])
<<<<<<< Updated upstream
    CommentChannel.broadcast_to @tweet, { comment: @comment, user: @comment.user } if @comment.save
  end
=======
    if @comment.save
      CommentChannel.broadcast_to @item, { comment: @comment, user: @comment.user }
    end
  end
  
>>>>>>> Stashed changes

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
