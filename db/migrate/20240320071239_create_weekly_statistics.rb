class CreateWeeklyStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :weekly_statistics do |t|
      t.date :year_month
      t.integer :week_of_month
      t.integer :active_users
      t.integer :booking_number

      t.timestamps
    end
  end
end
