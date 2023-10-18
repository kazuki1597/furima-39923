class CategoryIdController < ApplicationController
  def index
    def index
      @category_id = Category_id.order("created_at DESC")
    end
  end

  def new
  end
end
