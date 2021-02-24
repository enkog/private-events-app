class EventsController < ApplicationController
  before_action :require_user, except: %i[index show]
  def index
    @events = Event.all
    @past = Event.past
    @upcoming = Event.upcoming
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    @event.user = current_user
    if @event.save
      flash[:notice] = 'Event created'
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date)
  end
end
