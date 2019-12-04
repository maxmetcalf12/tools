# == Schema Information
#
# Table name: time_trackers
#
#  id             :bigint           not null, primary key
#  user_id        :bigint
#  name           :string
#  seconds_worked :integer
#  active         :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class TimeTracker < ApplicationRecord
  belongs_to :user
  has_many :time_tracker_sessions

  def set_seconds_worked
    seconds = 0
    time_tracker_sessions.each do |session|
      clocked_out_time = session.clocked_out.presence || DateTime.now.utc
      seconds += ((clocked_out_time - session.clocked_in)).to_i
    end
    self.seconds_worked = seconds
  end

  def hours_worked
    set_seconds_worked
    hours = seconds_worked / 3600
    minutes = (seconds_worked % 3600) / 60
    seconds = (seconds_worked % 60)
    "#{hours}:#{format '%02d', minutes}:#{format '%02d', seconds}"
  end

  def clocked_in
    time_tracker_sessions.each do |session|
      return true if session.clocked_in.present? && !session.clocked_out.present?
    end
    false
  end
end
