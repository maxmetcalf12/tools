class CreateTimeTrackers < ActiveRecord::Migration[6.0]
  def change
    create_table :time_trackers do |t|
      t.belongs_to :user

      t.string :name
      t.integer :seconds_worked
      t.boolean :active

      t.timestamps
    end
  end
end
