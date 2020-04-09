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

require "test_helper"

class TimeTrackerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
