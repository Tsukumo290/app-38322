class AddStartTimeToCalendars < ActiveRecord::Migration[6.0]
  def change
    add_column :calendars, :start_time, :date, null: false
  end
end
