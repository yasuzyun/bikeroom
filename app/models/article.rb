class Article < ApplicationRecord
  belongs_to :customer
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :article, dependent: :destroy
  has_one :spot
  #accepts_attachments_for :article_images, attachment: :image, append: true

  validates :customer_id, presence: true
  validates :title  , presence: true, length: {maximum: 200}
  validates :body, presence: true, length: {maximum: 200}
  # 存在性のバリデーション
  #validates :latitude, presence: true
  #validates :longitude, presence: true
  validates :title, presence: true   

  # バリデーションの前に送信されたaddressの値によってジオコーディング(緯度経度の算出)を行う
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
  #geocoded_by :address
  #after_validation :geocode, if: :address_changed?


  #def liked_by(customer, article)
   # Like.where(customer_id: customer.id, article_id: article.id).exists?
  #end
end
