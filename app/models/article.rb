class Article < ApplicationRecord
  belongs_to :customer
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :article_images, dependent: :destroy
  #accepts_attachments_for :article_images, attachment: :image, append: true

  validates :customer_id, presence: true
  validates :title  , presence: true, length: {maximum: 200}
  validates :body, presence: true, length: {maximum: 200}

  def liked_by(customer, article)
    Like.where(customer_id: customer.id, article_id: article.id).exists?
  end
end
