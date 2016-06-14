class JeansController < ApplicationController

	def index
		@jeans = Jeans.all
	end

  def new
    @jeans = Jeans.new
  end

  def show
    @jeans = Jeans.find(params[:id])
  end

  def create
    @jeans = Jeans.new(jeans_params)
    @jeans.user_id = current_user.id
    if @jeans.save
      flash[:success] = 'Your jeans have been added to your Coder Closet!'
      redirect_to @jeans
    else
      render 'new'
  	end
  end

  def edit
    @jeans = Jeans.find(params[:id])
  end

  def update
    @jeans = Jeans.find(params[:id])
    @jeans.user_id = current_user.id
    if @jeans.update(jeans_params)
      flash[:success] = 'Your jeans have been updated!'
    else
      render 'new'
    end
  end

  def destroy
    @jeans = Jeans.find_by(id: params[:id])
    @jeans.destroy
    flash[:success] = "Your jeans have been removed from your Coder Closet."
    redirect_to jeans_path
  end

  private
  def jeans_params
    params.require(:jeans).permit(:user_id, :name, :color, :worn, :image)
  end

end