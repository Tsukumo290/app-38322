class ChangeDatatypeStartTimeOfCalendars < ActiveRecord::Migration[6.0]
  def change
    change_column :calendars, :start_time, :datetime
  end
end
