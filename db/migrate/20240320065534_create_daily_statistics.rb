class CreateDailyStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_statistics do |t|
      t.date :date
      t.integer :active_users
      t.integer :booking_number
      t.float :average_booking_period
      t.float :percentile_99th_booking_period
      t.float :maximum_booking_period

      t.timestamps
    end
  end
end
