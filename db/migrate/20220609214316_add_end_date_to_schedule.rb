class AddEndDateToSchedule < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :end_date, :datetime
  end
end
