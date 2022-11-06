class Admin::ArticlesController < ApplicationController
   
  
  def index
    @articles = Article.includes(:customer).order("created_at DESC")
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: "削除しました"
  end
  
   private
 #def if_not_admin
  #  redirect_to root_path unless current_customer.admin?
  #end

  def article_params
    params.require(:article).permit(:title, :body, :address, :lat, :lng,:id)
  end
end
