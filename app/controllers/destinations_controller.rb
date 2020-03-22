class DestinationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :show]
  before_action :set_destination, only: [:edit, :update, :destroy, :show]

  def search
    if params[:search].blank?
      redirect_to(destinations_path) and return
    else
      @parameter = params[:search].downcase
      @destinations = Destination.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
      if @destinations.blank?
        flash[:alert] = "No such results found!"
        redirect_to destinations_path
      end
    end
  end

  def index
    @destinations = Destination.paginate(page: params[:page], per_page: 6)
  end

  def new
    if current_user.email == "deepakmahajan269@gmail.com"
      @destination = Destination.new
    else
      redirect_to root
    end
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      redirect_to destinations_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @destination.update(destination_params)
      redirect_to destinations_path
    else
      render 'edit'
    end
  end


  private

    def destination_params
      params.require(:destination).permit(:name, :url, :description)
    end

    def set_destination
      @destination = Destination.find(params[:id])
    end
end
