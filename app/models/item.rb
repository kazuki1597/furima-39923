class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    has_one :purchase_information
    has_one_attached :image
    validates :category_id,:sales_status_id,:shipping_free_status_id,:prefecture_id,:scheduled_delivery_id, numericality: { other_than: 1 , message: "１以外の値を選択してください"}
    validates :image,:name,:info,:category_id,:sales_status_id,:shipping_free_status_id,:prefecture_id,:scheduled_delivery_id,:price, presence: true
    belongs_to :category 
    belongs_to :sales_status
    belongs_to :shipping_free_status
    belongs_to :prefecture
    belongs_to :scheduled_delivery
    hannkakukana =  /\A[0-9]+\z/ 
    validates_format_of :price, with:  hannkakukana, message: '半角数値で設定してください'
    validates :price, numericality:{ greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "は ¥300~9,999,999 の間で半角数字で指定してください" }
    # validates :price, numericality: { in: 1..299}
    validates :price, numericality: { only_integer: true }
end
