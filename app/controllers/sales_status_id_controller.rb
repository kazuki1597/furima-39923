class SalesStatusIdController < ApplicationController
  def index
    @sales_status_id = Salesstatus.order("created_at DESC")
  end

  def new
  end
end
