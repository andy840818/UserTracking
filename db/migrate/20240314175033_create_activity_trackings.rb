class CreateActivityTrackings < ActiveRecord::Migration[7.0]
  def change
    create_table :activity_trackings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :action_type
      t.text :action_params
      t.datetime :timestamp

      t.timestamps
    end
  end
end
