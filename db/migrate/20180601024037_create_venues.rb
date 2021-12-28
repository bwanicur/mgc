class CreateVenues < ActiveRecord::Migration[6.1]
  def change
    create_table :venues do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false, limit: 2
      t.string :zipcode, null: false
      t.decimal :latitude
      t.decimal :longitude
      t.text :description
      t.string :phone
      t.string :email
      t.string :website
      t.integer :num_gigs, default: 0
      t.jsonb :optional_data, default: {}
      t.timestamps
    end
    add_index :venues, :user_id
    add_index :venues, %i[latitude longitude]
  end
end
