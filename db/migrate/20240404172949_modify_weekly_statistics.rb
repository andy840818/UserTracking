class ModifyWeeklyStatistics < ActiveRecord::Migration[7.0]
  def change
    remove_column :weekly_statistics, :year_month, :date
    remove_column :weekly_statistics, :week_of_month, :integer

    add_column :weekly_statistics, :start_date, :date
    add_column :weekly_statistics, :end_date, :date
  end
end
