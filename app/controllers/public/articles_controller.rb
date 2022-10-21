class Public::ArticlesController < ApplicationController
  
 def index
    #@article = Article.find(params[:id])
    #@last_article = Article.last
    @articles = Article.all
    @article = Article.new
    #  .all
    #  .eager_load(:customer, :likes, :comments)
    #  .page(params[:page])
    #  .per(5)
    #  .reverse_order
  end

  def show
     @articles = Article.all
     #@article = Article.find(params[:id])
    #@comment = Comment.new
  end

  def new
   
    @last_article = Article.last
    @articles = Article
      .all
      .eager_load(:customer, :likes, :comments)
      .page(params[:page])
      .per(5)
      .reverse_order 
    #gon.customers = Customer.all
    
  end

  def create
    @article = Article.new(article_params)
    @article.customer_id = current_customer.id
    @customer = current_customer
   # binding.pry
     if @article.save
      redirect_to articles_path, notice: "新しい記事を投稿しました。"
      
    else
      @article = Article.all
      render :index
    end
  end
    


  def edit
    #@article = Article.all
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path, notice: "更新しました"
    else
      render :new
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to request.referer
    
   # @articles = Article.find(params[:id])
    #if @articles.destroy
     # redirect_to article_path
    #else
    #  redirect_to article_path(@article)
    #end
  #end
  #  if @article = Article.find(params[:id]).destroy
   #   redirect_to articles_path, notice: "記事を削除しました"
    #else
     # redirect_to "/", notice: "エラーが発生しました"
    #end
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :body, :address, :latitude, :longitude)
    #params.require(:map).permit(:address, :latitude, :longitude, :title, :comment)
  end
end