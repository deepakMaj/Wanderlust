class DestinationcommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @destination = Destination.find(params[:destination_id])
    @destinationcomment = @destination.destinationcomments.create(params[:destinationcomment].permit(:body))
    flash[:notice] = "Comment was successfully posted"
    redirect_to adventure_path(@destination)
  end

  def edit
    @destination = Destination.find(params[:destination_id])
    @destinationcomment = @destination.destinationcomments.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:destination_id])
    @destinationcomment = @destination.destinationcomments.update(params[:destinationcomment].permit(:body))
    redirect_to destination_path(@destination)
  end

  def destroy
    @destination = Destination.find(params[:destination_id])
    @destinationcomment = @destination.destinationcomments.find(params[:id])
    @destinationcomment.destroy
    flash[:notice] = "Comment was successfully deleted"
    redirect_to destination_path(@destination)
  end
end
