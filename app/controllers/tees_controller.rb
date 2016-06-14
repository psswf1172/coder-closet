class TeesController < ApplicationController

	def index
		@tees = Tee.all
	end

  def new
    @tee = Tee.new
  end

  def show
    @tee = Tee.find(params[:id])
  end

  def create
    @tee = Tee.new(tee_params)
    @tee.user_id = current_user.id
    if @tee.save
      flash[:success] = 'Your tee has been added to your Coder Closet!'
      redirect_to @tee
    else
      render 'new'
  	end
  end

  def edit
    @tee = Tee.find(params[:id])
  end

  def update
    @tee = Tee.find(params[:id])
    @tee.user_id = current_user.id
    if @tee.update(tee_params)
      flash[:success] = 'Your tee has been updated!'
    else
      render 'new'
    end
  end

  def destroy
    @tee = Tee.find_by(id: params[:id])
    @tee.destroy
    flash[:success] = "Your tee is removed from your Coder Closet."
    redirect_to Tees_path
  end

  private
  def tee_params
    params.require(:tee).permit(:user_id, :name, :color, :worn, :image)
  end

end