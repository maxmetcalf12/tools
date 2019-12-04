class TimeTrackersController < ApplicationController
  def index
    @time_trackers = TimeTracker.where(user: @user)
    @new_tracker = TimeTracker.new
  end

  def show
    @time_tracker = TimeTracker.find(params[:id])
  end

  def create
    TimeTracker.create(time_tracker_params)

    redirect_to time_trackers_path
  end

  def destroy
    TimeTracker.find(params[:id]).destroy

    redirect_to time_trackers_path
  end

  def clock_in
    tracker = TimeTracker.find(params[:time_tracker_id])

    return redirect_to time_trackers_path, alert: "You've already clocked in, clock out before clocking in again" if tracker.clocked_in
    tracker_session = TimeTrackerSession.create(time_tracker_id: tracker.id, clocked_in: DateTime.now)
    redirect_to time_trackers_path, notice: "You've been clocked in"
  end

  def clock_out
    tracker = TimeTracker.find(params[:time_tracker_id])
    tracker_sessions = TimeTrackerSession.where(time_tracker_id: tracker.id, clocked_out: nil)
    tracker_sessions.each do |session|
      session.update(clocked_out: DateTime.now)
    end
    redirect_to time_trackers_path, notice: "You've been clocked out"
  end

  private

  def time_tracker_params
    params.require(:time_tracker).permit(
      :name,
      :user_id
    )
  end
end
