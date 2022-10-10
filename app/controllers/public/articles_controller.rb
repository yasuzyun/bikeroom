class Public::ArticlesController < ApplicationController
  
 def index
    #@article = Article.new(article_params)
    #@last_article = Article.last
    @articles = Article.all
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
    #@article = Article.find(params[:id])
    #@article = Article.all
    @last_article = Article.last
    @articles = Article
      .all
      .eager_load(:customer, :likes, :comments)
      .page(params[:page])
      .per(5)
      .reverse_order 
    
  end

  def create
    @article = Article.new(article_params)
    @article.customer_id = current_customer.id
    @customer = current_customer
    if @article.save
      redirect_to @article, notice: "新しい記事を投稿しました。"
    else
      @article = Article.all
      render :index
    end
  end

  def edit
    #@article = Article.all
    @articles = Article.all
  end

  def update
    set_article(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article.id), notice: "編集を適用しました"
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(prams[:id])
    if @article.destroy
      redirect_to articles_path
    else
      redirect_to article_path(@article)
    end
  end
  #  if @article = Article.find(params[:id]).destroy
  #    redirect_to articles_path, notice: "記事を削除しました"
  #  else
  #    redirect_to "/", notice: "エラーが発生しました"
  #  end
  #end

  private
  
  def article_params
    params.require(:article).permit(:title, :body)
  end
end