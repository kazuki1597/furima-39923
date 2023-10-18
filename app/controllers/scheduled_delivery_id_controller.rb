class ScheduledDeliveryIdController < ApplicationController
  def index
    @scheduled_delivery_id = Scheduleddelivery.order("created_at DESC")
  end

  def new
  end
end
