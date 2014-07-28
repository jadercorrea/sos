class ServiceOrdersController < ApplicationController
  before_filter :load_resources, only: [:new, :edit, :update, :create]

  def index
    serviceorders_per_user_role(current_user)
  end

  def show
    @service_order = ServiceOrder.find(params[:id])
  end

  def new
    @service_order = ServiceOrder.new
  end

  def edit
    @service_order = ServiceOrder.find(params[:id])
  end

  def create
    @service_order = ServiceOrder.new(params[:service_order])

    if @service_order.save
      SosMailer.os_email(@service_order, "incluida").deliver
      redirect_to @service_order, notice: 'Service order was successfully created.'
    else
      render "new"
    end
  end

  def update
    @service_order = ServiceOrder.find(params[:id])

    if @service_order.update_attributes(params[:service_order])
      SosMailer.os_email(@service_order, "atualizada").deliver
      redirect_to @service_order, notice: 'Service order was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @service_order = ServiceOrder.find(params[:id])
    @service_order.destroy

    redirect_to service_orders_url
  end

  private

  def serviceorders_per_user_role(user)
    entity = "ServiceOrder"
    entity = "current_user.client.service_orders" if user.client?
    entity = "current_user.service_orders" if user.colaborator?

    @service_orders = load_service_orders(entity)
  end

  def load_service_orders(entity)
    eval("#{entity}.page(params['page']).per(10)")
  end
end
