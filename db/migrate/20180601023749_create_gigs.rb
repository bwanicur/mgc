class CreateGigs < ActiveRecord::Migration[6.1]
  def change
    create_table :gigs do |t|
      t.integer :region_id, null: false
      t.integer :user_id, null: false
      t.integer :venue_id, null: false
      t.string :title, null: false
      t.date :date, null: false
      t.string :start_time, null: false
      t.datetime :starts_at, null: false
      t.string :end_time
      t.text :description
      t.string :map_link
      t.text :musician_text
      t.integer :hours_before_reminder
      t.datetime :reminder_at
      t.jsonb :optional_data, default: {}
      t.timestamps

      t.index :region_id
      t.index :user_id
      t.index :reminder_at
    end
  end
end
