class SignupsController < ApplicationController
  

  def create
    @signup = Signup.new(signup_params)
    if @signup.save
      redirect_to event_path(signup_params[:event_id])
    else
      redirect_to events_path
    end
  end

  def destroy
    @signup = Signup.find_by(event_id: signup_params[:event_id], guest_id: signup_params[:guest_id]).destroy
    redirect_to event_path(signup_params[:event_id])
  end

  def update
    @signup_line = Signup.find(signup_approved_params[:id])
    @signup_line.update_attributes(accepted: signup_approved_params[:accepted])
    redirect_to event_path(@signup_line.event_id)
  end

  private
  # useless function for now
    def signup_params
      params.require(:signup).permit(:event_id, :guest_id)
    end

    def signup_approved_params
      params.require(:signup).permit(:id, :accepted)
    end

end
