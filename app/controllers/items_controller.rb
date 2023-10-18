class ItemsController < ApplicationController
    def index
        @item = Item.all
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(room_params)
        if @item.save
          redirect_to root_path
        else
          render :new, status: :unprocessable_entity
        end
    end

    private

    def room_params
        params.require(:item).permit(:image,:name,:info,:category_id,:sales_status_id,:shipping_free_status_id,:prefecture_id,:scheduled_delivery_id,:price).merge(user_id: current_user.id)
    end                                                                                                                        

end
