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
     #@article = Article.new
     @article = Article.find(params[:id])
     @comments = @article.comments  #投稿詳細に関連付けてあるコメントを全取得
    # @comment = current_customer.comments.new  #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
     @comment = Comment.new
  end

  def new
 
   @article = Article.new
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
     #byebug
    @article = Article.new(article_params)
    @article.customer_id = current_customer.id
    @customer = current_customer
     if @article.save
      redirect_to articles_path, notice: "新しい記事を投稿しました。"
     else
      @articles = Article.all
      #@article = Article.all
      render :new
     end
  end
    


  def edit
    #@article = Article.all
    @article = Article.find(params[:id])
    unless @article.customer == current_customer
      redirect_to  new_article_path
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.customer != current_customer
      redirect_to  new_article_path
    else
     if @article.update(article_params)
      redirect_to articles_path, notice: "更新しました"
     else
      render :new
     end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.customer != current_customer
      redirect_to  new_article_path
    else
    @article.destroy
    redirect_to articles_path, notice: "削除しました"
    
    end
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :body, :address, :lat, :lng)
    #params.require(:map).permit(:address, :latitude, :longitude, :title, :comment)
  end
end
