class Comment < ApplicationRecord
  #before_action :authenticate_user! 
  
  belongs_to :customer #Comment.customerでコメントの所有者を取得
  belongs_to :article #Comment.articleでそのコメントがされた投稿を取得
end
