# == Schema Information
#
# Table name: time_tracker_sessions
#
#  id              :bigint           not null, primary key
#  time_tracker_id :bigint
#  clocked_in      :datetime
#  clocked_out     :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class TimeTrackerSession < ApplicationRecord
  belongs_to :time_tracker, required: true

  def pretty_clocked_in
    clocked_in.localtime.strftime('%b %-d at %l:%M %P')
  end

  def pretty_clocked_out
    clocked_out.localtime.strftime('%b %-d at %l:%M %P')
  end
end
