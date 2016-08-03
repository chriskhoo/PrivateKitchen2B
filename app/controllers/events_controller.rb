class EventsController < ApplicationController
  before_action :host_user,     only: :edit

  def index
    @events = Event.paginate(page: params[:page], per_page: 10)
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @signup = Signup.new
    @signup_list = Signup.where(event_id: params[:id])
    @guests = event_guests
    @requested_ans = requested?
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.host_id = session[:user_id]
    if @event.save
      flash[:success] = "New event created"
      redirect_to @event
    else
      render 'new'
    end
  end


  def update
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event deleted"
    redirect_to events_url
  end

  private
    def event_params
      params.require(:event).permit(:name, :host_id, :date, :venue, :num_guests, :cuisine, :first_course, :main_course, :dessert_course, :cost_per_pax, :picture)
    end

    def host_user
      @user = User.find(session[:user_id])
      @event = Event.find(params[:id])
      redirect_to events_url unless @user == @event.host
    end

    def event_guests
      event_signups = Event.find(params[:id]).signups
      event_guest_ids = event_signups.map(&:guest_id)
      User.find(event_guest_ids)
    end

    def requested?
      event_guest_ids = Signup.where(event_id: params[:id]).map(&:guest_id)
      event_guest_ids.include?(session[:user_id])
    end

end
