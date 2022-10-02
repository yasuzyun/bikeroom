class Public::ArticlesController < ApplicationController
  
  def index
   @tweet = Tweet.new
  end

  def show
   
  end

  def create
     @tweet = Tweet.new(tweet_params)
     @tweet.user_id = current_user.id
     @current = current_user
    if @tweet.save
      redirect_to @tweet, notice: "successfully created book!"
      # redirect_to book_path(@book), notice: 'You have creatad book successfully.'
    else
      @tweets = Tweet.all
      render :index
    end 
  end

  def edit
   
  end

  def update
   
  end

  def destroy
    
  end

  private
    def tweet_params
      params.require(:tweet).permit(:title, :body)
    end
    
end

