class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    has_many :purchase_information
    has_one_attached :image
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :image,:name,:info,:category_id,:sales_status_id,:shipping_free_status_id,:prefecture_id,:scheduled_delivery_id,:price, presence: true
    belongs_to :category 
    belongs_to :sales_status
    belongs_to :shipping_free_status
    belongs_to :prefecture
    belongs_to :scheduled_delivery
    hannkakukana =  /\A[0-9]+\z/ 
    validates_format_of :price, with:  hannkakukana, message: '半角数値で設定してください'
    validates :price, numericality: { in: 300..9999999 }
    # validates :price, numericality: { in: 1..299}
    validates :price, numericality: { only_integer: true }
end
