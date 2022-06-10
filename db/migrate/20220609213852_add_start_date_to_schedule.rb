class AddStartDateToSchedule < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :start_date, :datetime
  end
end
