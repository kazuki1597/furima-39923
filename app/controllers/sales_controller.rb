class SalesController < ApplicationController
    class SalesController < ApplicationController
        def new
          @sale = Sale.new
        end
      
        def create
          @sale = Sale.new(sale_params)
          @sale.profit = @sale.sale_amount - @sale.cost
      
          if @sale.save
            redirect_to @sale, notice: 'Sale was successfully created.'
          else
            render :new
          end
        end
      
        private
      
        def sale_params
          params.require(:sale).permit(:image,:name,:info,:category_id,:sales_status_id,:shipping_free_status_id,:prefecture_id,:scheduled_delivery_id,:price).merge(user_id: current_user.id)
        end
      end
end
