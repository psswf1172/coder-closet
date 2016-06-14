class SneakersController < ApplicationController

	def index
		@sneakers = Sneakers.all
	end

  def new
    @sneakers = Sneakers.new
  end

  def show
    @sneakers = Sneakers.find(params[:id])
  end

  def create
    @sneakers = Sneakers.new(sneakers_params)
    @sneakers.user_id = current_user.id
    if @sneakers.save
      flash[:success] = 'Your sneakers have been added to your Coder Closet!'
      redirect_to @sneakers
    else
      render 'new'
  	end
  end

  def edit
    @sneakers = Sneakers.find(params[:id])
  end

  def update
    @sneakers = Sneakers.find(params[:id])
    @sneakers.user_id = current_user.id
    if @sneakers.update(sneakers_params)
      flash[:success] = 'Your sneakers have been updated!'
    else
      render 'new'
    end
  end

  def destroy
    @sneakers = Sneakers.find_by(id: params[:id])
    @sneakers.destroy
    flash[:success] = "Your sneakers have been removed from your Coder Closet."
    redirect_to sneakers_path
  end

  private
  def sneakers_params
    params.require(:sneakers).permit(:user_id, :name, :color, :worn, :image)
  end

end