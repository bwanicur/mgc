class CreateGigs < ActiveRecord::Migration[5.1]
  def change
    create_table :gigs do |t|
      t.integer :user_id, null: false
      t.integer :venue_id, null: false
      t.boolean :is_template, default: false
      t.string :title, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time
      t.string :short_description
      t.text :description
      t.string :map_link
      t.jsonb :optional_data, default: {} 

      t.timestamps
    end
    add_index :gigs, :user_id
    add_index :gigs, :venue_id
  end
end
