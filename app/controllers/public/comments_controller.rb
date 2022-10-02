class Public::CommentsController < ApplicationController
    
  before_action :baria_user,   only: [:edit, :update]

  def show
    @customer = current_customer.find(params[:id])
    @tweet = tweet.where(user_id: params[:id])
    @tweet = tweet.new
  end

  def index
    @customer = current_customer
    @customer = current_customer.all
  end

  def update
      @user = User.find(params[:id])

 

      if @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to user_path(@user.id)
      else
        render :edit
      end
  end

  private

  def user_params
    params.require(:customer).permit(:last_name,:first_name)
  end
  
  def baria_user
  	unless params[:id].to_i == current_user.id
  		redirect_to user_path(current_user)
  	end
  end
  
end
