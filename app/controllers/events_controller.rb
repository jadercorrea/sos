class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :load_resources, only: [:new, :edit, :update, :create]

  def index
    filter_per_user_role(current_user)
  end

  def show
  end

  def new
    @event = Event.new

    if params[:from_ticket].present?
      @ticket = Ticket.find(params[:from_ticket])
      @event.ticket_id = @ticket.id
      @event.client_id = @ticket.client_id
      @event.title = @ticket.title
    end
  end

  def edit
  end

  def create
    @event = Event.new(event_params.merge(user_id: current_user.id))

    if @event.save
      redirect_to events_url, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:title, :description, :start_datetime, :client_id, :ticket_id)
  end

  def load_resources
    @clients = Client.all.map { |m| [m.name, m.id] }
    @users = User.colaborators.to_a.map { |m| [m.name, m.id] }
  end

  def filter_per_user_role(user)
    entity = ""
    entity = "Event" if user.admin?
    entity ||= "user.client.events" if user.colaborator?
    @events = load_events(entity)
  end

  def load_events(entity)
    year = (params[:year] || Time.now.year).to_i
    month = (params[:month] || Time.now.month).to_i
    entity.present? ? eval(entity+".this_month(year, month).to_a") : []
  end
end
