class Public::LikesController < ApplicationController
  
  
def create
  @article_like = Like.new(customer_id: current_customer.id, article_id: params[:article_id])
  @article_like.save
  redirect_to article_path(params[:article_id]) 
end

def destroy
  @article_like = Like.new(customer_id: current_customer.id, article_id: params[:article_id])
  @article_like.destroy
  redirect_to article_path(params[:article_id])
end
end