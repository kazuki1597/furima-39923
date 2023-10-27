class PayPurchase
    include ActiveModel::Model
    attr_accessor :postal_code,:prefecture_id,:city,:addlesses,:building,:phone_number,:token,:user_id,:item_id
    # attr_accessorとは、ダミーのカラム情報を取り扱えるようにする
  
    with_options presence: true do
        validates :token
        validates :postal_code, :city, :addlesses, :phone_number
        validates :user_id,:item_id
        validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: '郵便番号を入力してください'}
        validates :phone_number, format: { with: /\A\d{10,11}\z/ , message:'電話番号を入力してください' }
        validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
        #カラム名でバリデーションのチェック

      end

    def save
      # 各テーブルにデータを保存する処理を書く
      purchase_information = PurchaseInformation.create!(item_id: item_id, user_id: user_id)
      PayForm.create(postal_code: postal_code,prefecture_id: prefecture_id,city: city,addlesses: addlesses,building: building,phone_number: phone_number, purchase_information_id: purchase_information.id)
    end

end
