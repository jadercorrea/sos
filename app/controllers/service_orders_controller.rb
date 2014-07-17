class ServiceOrdersController < ApplicationController
  before_filter :load_resources, only: [:new, :edit, :update, :create]

  def index
    filter_per_user_role(current_user)
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
      render action: "new"
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

  def load_resources
    @clients = Client.all.map { |m| [m.name, m.id] }
    @users = User.colaborators.to_a.map { |n| [n.name, n.id] }
  end

  def filter_per_user_role(current_user)
    if current_user.client?
      @service_orders = current_user.client.service_orders.page(params['page']).per(10)
    elsif current_user.colaborator?
      @service_orders = current_user.service_orders.page(params['page']).per(10)
    else
      @service_orders = ServiceOrder.page(params['page']).per(10)
    end
  end
end
