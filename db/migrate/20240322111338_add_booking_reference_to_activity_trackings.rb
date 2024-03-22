class AddBookingReferenceToActivityTrackings < ActiveRecord::Migration[7.0]
  def change
    add_reference :activity_trackings, :booking, null: true, foreign_key: true
  end
end
