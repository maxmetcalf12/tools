class CreateTimeTrackerSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :time_tracker_sessions do |t|
      t.belongs_to :time_tracker

      t.datetime :clocked_in
      t.datetime :clocked_out

      t.timestamps
    end
  end
end
