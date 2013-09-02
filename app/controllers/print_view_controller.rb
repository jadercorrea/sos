class PrintViewController < ApplicationController
  layout false
  def show
    @service_order = ServiceOrder.find(params[:id])
  end
end


