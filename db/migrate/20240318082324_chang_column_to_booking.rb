class ChangColumnToBooking < ActiveRecord::Migration[7.0]
  def up
    change_column :bookings, :status, 'integer USING CAST(status AS integer)'
    change_column_default :bookings, :status, 0
  end
end
