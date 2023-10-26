class PurchaseInformationsController < ApplicationController
    # まずはログインしてください
    before_action :set, only: [:index,:create]
    before_action :authenticate_user!
    before_action :move_to_root 
    before_action :move_to_root_sold 

    def index
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
        @pay_form = PayPurchase.new

    end

    def create
        #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
        @pay_form = PayPurchase.new(purchase_information_params) 

        if @pay_form.valid?
            pay_item
           @pay_form.save
           #  PayPurchaseモデルのdef saveのメソッドを呼び出し
          return redirect_to root_path
        else
          gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
          render :index, status: :unprocessable_entity
        end
        
    end


    private

  def purchase_information_params
    params.require(:pay_purchase).permit(:postal_code,:prefecture_id,:city,:addlesses,:building,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item[:price],  # 商品の値段
      card: purchase_information_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  #出品者だった場合はトップページへ遷移
  def move_to_root
    # ログイン者と出品者だったら
    if user_signed_in? && current_user.id == @item.user_id 
      redirect_to root_path
    end 
  end

    #商品が売却済みだった場合はトップページへ遷移
    # if文はtrueのみ中身の記述が読み込まれる
  def move_to_root_sold
    # @itemを定義しないと中身がなかったから
    if user_signed_in? && current_user.id != @item.user_id && @item.purchase_information.present?
      redirect_to root_path
    end 
  end

  def set
    @item = Item.find(params[:item_id])
end

end
# parameter{モデル名(form_withで記述していただいた mode: @~~~で定義していただいたモデルの名前が必要)