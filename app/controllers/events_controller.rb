class EventsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :host_user,                       only: :edit
  before_action :logged_in_user

  def index
    @events = Event.order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 10)
    #
    # .filter(params.slice(:name, :host_id, :date, :cuisine, :cost_per_pax))
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @host = User.find(@event.host_id)
    @signup = Signup.new
    @signup_list = Signup.where(event_id: params[:id])
    @guests = event_guests
    @requested_ans = requested?
    @num_guests_approved = num_guests_approved
    @num_seats_remaining = num_seats_remaining
    @guests_waiting = @signup_list.count - @num_guests_approved
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

    def num_guests_approved
      # reference signup table for this event
      # check approved column and count number of trues
      Event.find(params[:id]).signups.where(accepted: true).count
    end

    def num_seats_remaining
      # reference signup table for this event
      # check approved column and count number of trues
      Event.find(params[:id]).num_guests - num_guests_approved
    end

    def sort_column
      Event.column_names.include?(params[:sort]) ? params[:sort] : "date"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end


end
