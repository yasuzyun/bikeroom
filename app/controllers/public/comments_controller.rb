class Public::CommentsController < ApplicationController
    
    before_action :set_article, only: [:create, :destroy] 
    
  def create
    #byebug
  @comment = @article.comments.create(comment_params)
  if @comment.save
    redirect_to article_path(@article), notice: 'コメントしました'
  else
    flash.now[:alert] = 'コメントに失敗しました'
    render article_path(@article)
  end
  end

def destroy
    @comment = Comment.find(params[:id])
  if @comment.destroy
    redirect_to article_path(@article), notice: 'コメントを削除しました'
  else
    flash.now[:alert] = 'コメント削除に失敗しました'
    render article_path(@article)
  end
end
  
  
 

private
def set_article
  @article = Article.find(params[:article_id])
end

def comment_params
  params.required(:comment).permit(:comment_content).merge(customer_id: current_customer.id, article_id: params[:article_id])
end

end