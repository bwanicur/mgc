class CreateGigs < ActiveRecord::Migration[6.1]
  def change
    create_table :gigs do |t|
      t.integer :region_id, null: false
      t.integer :user_id, null: false
      t.integer :venue_id, null: false
      t.string :priv_hash, null: false
      t.string :title, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time
      t.string :short_description
      t.text :description
      t.string :map_link
      t.text :musician_text
      t.jsonb :optional_data, default: {}

      t.timestamps
    end
    add_index :gigs, :user_id
    add_index :gigs, :priv_hash, unique: true
  end
end
