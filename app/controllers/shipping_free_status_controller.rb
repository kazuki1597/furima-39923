class ShippingFreeStatusController < ApplicationController
  def index
    @shipping_free_status_id  = Shippingfreestatus .order("created_at DESC")
  end

  def new
  end
end
