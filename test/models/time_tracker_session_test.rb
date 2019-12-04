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

require 'test_helper'

class TimeTrackerSessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
