class UsersController < ApplicationController
	# from the devise social-login-in-rails
	before_filter :set_user, only [:show, :edit, :update]
	before_filter :validate_authorization_for_user, only: [:edit, :update]

  def show
  end

  def edit
  end

  def index
  	@users = User.all
  end

  def update
  	if @user.update_attributes(user_params)
  		redirect_to @user, notice: "User has been successfully updated."
  	else
  		render action: 'edit'
  	end
  end

  # def create
  #   @user = User.new(user_params)
  #   @user = current_user
  #   if @user.save
  #     log_in @user
  #     flash[:success] = 'Welcome to Coder Closet -- where the important programmers throw their threads.'
  #     redirect_to @user
  #   else
  #     render 'new'
  #   end
  # end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def validate_authorization_for_user
  	redirect_to root_path unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:name, :user, :about)
  end

end
