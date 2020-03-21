class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @adventure = Adventure.find(params[:adventure_id])
    @comment = @adventure.comments.create(params[:comment].permit(:body))
    flash[:notice] = "Comment was successfully posted"
    redirect_to adventure_path(@adventure)
  end

  def edit
    @adventure = Adventure.find(params[:adventure_id])
    @comment = @adventure.comments.find(params[:id])
  end

  def update
    @adventure = Adventure.find(params[:adventure_id])
    @comment = @adventure.comments.update(params[:comment].permit(:body))
    redirect_to adventure_path(@adventure)
  end

  def destroy
    @adventure = Adventure.find(params[:adventure_id])
    @comment = @adventure.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment was successfully deleted"
    redirect_to adventure_path(@adventure)
  end

end
