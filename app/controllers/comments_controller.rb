# Comments controller
class CommentsController < ApplicationController

  def new
    @loo = Loo.find(params[:loo_id])
    @comment = Comment.new
  end

  def create
    @loo = Loo.find(params[:loo_id])
    @loo.comments.create(comment_params)
    redirect_to '/loos'
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
