class ParkcommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @park = Park.find(params[:park_id])
    @parkcomment = @park.parkcomments.create(params[:parkcomment].permit(:body))
    flash[:notice] = "Comment was successfully posted"
    redirect_to park_path(@park)
  end

  def edit
    @park = Park.find(params[:park_id])
    @parkcomment = @park.parkcomments.find(params[:id])
  end

  def update
    @park = Park.find(params[:park_id])
    @parkcomment = @park.parkcomments.update(params[:parkcomment].permit(:body))
    redirect_to park_path(@park)
  end

  def destroy
    @park = Park.find(params[:park_id])
    @parkcomment = @park.parkcomments.find(params[:id])
    @parkcomment.destroy
    flash[:notice] = "Comment was successfully deleted"
    redirect_to park_path(@park)
  end

end
