class StaticPagesController < ApplicationController
  # before_action :redirect_when_not_loggedin,      only: :home
  before_action :logged_in_user,                    only: :home

  def home
    @user = User.find(session[:user_id])
    @my_hosted_events = Event.where(host_id: session[:user_id])
    @my_accepted_events = Event.find(Signup.where(guest_id: session[:user_id], accepted: true).map(&:event_id))
    @my_waitlisted_events = Event.find(Signup.where(guest_id: session[:user_id], accepted: false).map(&:event_id))
  end

  def help
  end

  def about
  end

  private

end
