class ChangColumnToBooking < ActiveRecord::Migration[7.0]
  def up
    change_column :bookings, :status, 'integer USING CAST(status AS integer)'
  end
end
