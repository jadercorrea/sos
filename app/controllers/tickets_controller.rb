class TicketsController < ApplicationController
  before_filter :load_clients, only: [:new, :edit, :create, :update]
  before_filter :load_users, only: [:new, :edit, :create, :update]

  def index
    if current_user.client?
      @tickets = current_user.client.tickets.page(params['page']).per(10)
    else
      @tickets = Ticket.page(params['page']).per(10)
    end 
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
    @ticket.messages.build
  end

  def edit
    @ticket = Ticket.find(params[:id])
    @ticket.messages.build
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    @ticket.messages.first.user = current_user

    if @ticket.save
      redirect_to tickets_path, notice: 'Ticket was successfully created.'
    else
      render :new
    end
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.messages.select { |msg| msg.user.blank? }.each { |msg| msg.user = current_user }

    ticket_user_update

    if @ticket.update_attributes(params[:ticket])
      redirect_to edit_ticket_path(@ticket), notice: 'Ticket was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    redirect_to tickets_url
  end

  private

  def ticket_user_update
    params[:ticket][:messages_attributes].each do |key, value|
      params[:ticket][:messages_attributes][key] = value.merge(:user_id => current_user.id)
    end
  end

  def load_clients
    @clients = Client.all.map { |m| [m.name, m.id] }
  end

   def load_users
    @users = User.colaborators.map { |m| [m.name, m.id] }
  end
end
