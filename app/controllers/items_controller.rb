class ItemsController < ApplicationController
    before_action :authenticate_user!, only:[:new,:create,:edit,:destroy]
    before_action :set_item, only: [:show,:edit,:update,:destroy]
    before_action :move_to_index, only: [:edit,:destroy]
    before_action :move, only: [:edit]
    def index
        @items = Item.all.order("created_at DESC")
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        if @item.save
          redirect_to root_path
        else
          render :new, status: :unprocessable_entity
        end
    end

    def show
    end

    def edit
    end

    def update
        if @item.update(item_params)
          redirect_to item_path(@item.id)
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @item.destroy
        redirect_to root_path
    end

    private

    def item_params
        params.require(:item).permit(:image,:name,:info,:category_id,:sales_status_id,:shipping_free_status_id,:prefecture_id,:scheduled_delivery_id,:price).merge(user_id: current_user.id)
    end                                                                                                                        

    def set_item
        @item = Item.find(params[:id])
    end

    def move_to_index
      unless current_user.id == @item.user_id 
        redirect_to action: :index
      end 
    end

      def move
       if @item.purchase_information.present? 
          redirect_to action: :index
        end 
      end
end
