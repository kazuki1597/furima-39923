class PrefectureIdController < ApplicationController
  def index
    @prefecture_id = Prefecture.order("created_at DESC")
  end

  def new
  end

 
end


