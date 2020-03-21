class AdventuresController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :update, :show]
  before_action :set_adventure, only: [:edit, :update, :destroy, :show]

  def search
    if params[:search].blank?
      redirect_to(adventures_path) and return
    else
      @parameter = params[:search].downcase
      @adventures = Adventure.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
      if @adventures.blank?
        flash[:alert] = "No such results found!"
        redirect_to adventures_path
      end
    end
  end

  def index
    @adventures = Adventure.paginate(page: params[:page], per_page: 3)
  end

  def new
    if current_user.email == "deepakmahajan269@gmail.com"
      @adventure = Adventure.new
    else
      redirect_to root
    end
  end

  def create
    @adventure = Adventure.new(adventure_params)
    if @adventure.save
      redirect_to adventures_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @adventure.update(adventure_params)
      redirect_to adventures_path
    else
      render 'edit'
    end
  end


  private

    def adventure_params
      params.require(:adventure).permit(:name, :url, :description, :hashtags)
    end

    def set_adventure
      @adventure = Adventure.find(params[:id])
    end

end
