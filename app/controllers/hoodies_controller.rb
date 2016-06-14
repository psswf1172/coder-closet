class HoodiesController < ApplicationController

	def index
		@hoodies = Hoodie.all
	end

  def new
    @hoodie = Hoodie.new
  end

  def show
    @hoodie = Hoodie.find(params[:id])
  end

  def create
    @hoodie = Hoodie.new(hoodie_params)
    @hoodie.user_id = current_user.id
    if @hoodie.save
      flash[:success] = 'Your Hoodie has been added to your Coder Closet!'
      redirect_to @hoodie
    else
      render 'new'
  	end
  end

  def edit
    @hoodie = Hoodie.find(params[:id])
  end

  def update
    @hoodie = Hoodie.find(params[:id])
    @hoodie.user_id = current_user.id
    if @hoodie.update(hoodie_params)
      flash[:success] = 'Your hoodie has been updated!'
    else
      render 'new'
    end
  end

  def destroy
    @hoodie = Hoodie.find_by(id: params[:id])
    @hoodie.destroy
    flash[:success] = "Your hoodie is removed from your Coder Closet."
    redirect_to hoodies_path
  end

  private
  def hoodie_params
    params.require(:hoodie).permit(:user_id, :name, :color, :worn, :image)
  end

end
