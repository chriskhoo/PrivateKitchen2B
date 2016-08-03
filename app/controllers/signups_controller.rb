class SignupsController < ApplicationController
  def create
    @signup = Signup.new(event_id: params[:event_id], guest_id: params[:guest_id])
    if @signup.save
      redirect_to event_path(params[:event_id])
    else
      redirect_to events_path
    end
  end

  def destroy
    @signup = Signup.find_by(event_id: params[:event_id], guest_id: params[:guest_id]).destroy
    redirect_to event_path(params[:event_id])
  end

  def update
    @signup_line = Signup.find(params[:signup_id])
    @signup_line.update_attributes(accepted: params[:accept_request])
    redirect_to event_path(@signup_line.event_id)
  end

  private
  # useless function for now
    def signup_params
      params.require(:signup).permit(:event_id, :guest_id)
    end

end
