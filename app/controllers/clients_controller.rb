class ClientsController < ApplicationController
  def index
    @clients = Client.order(:name).page(params['page']).per(10)
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end

  def create
    create_entity("client")
  end

  def update
    update_entity("client")
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    redirect_to clients_url
  end
end
