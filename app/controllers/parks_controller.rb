class ParksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :show]
  before_action :set_parks, only: [:edit, :update, :destroy, :show]

  def search
    if params[:search].blank?
      redirect_to(parks_path) and return
    else
      @parameter = params[:search].downcase
      @parks = Park.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
      if @parks.blank?
        flash[:alert] = "No such results found!"
        redirect_to parks_path
      end
    end
  end

  def index
    @parks = Park.paginate(page: params[:page], per_page: 6)
  end

  def new
    if current_user.email == "deepakmahajan269@gmail.com"
      @park = Park.new
    else
      flash[:notice] = "Only admin can perform those operations"
      redirect_to root_path
    end
  end

  def create
    @park = Park.new(park_params)
    if @park.save
      redirect_to parks_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @park.update(park_params)
      redirect_to parks_path
    else
      render 'edit'
    end
  end


  private

    def park_params
      params.require(:park).permit(:name, :url, :description)
    end

    def set_parks
      @park = Park.find(params[:id])
    end
end
