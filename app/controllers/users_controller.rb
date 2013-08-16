class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  def show
  	@user = User.find(params[:id])
  end
   def create
    @user = User.new(params[:user])    # Not the final implementation! ??? Maybe it is.
    if @user.save
      sign_in @user # When signup, if successful, also signin.
    	flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end

