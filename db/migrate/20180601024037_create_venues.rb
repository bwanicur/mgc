class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.boolean :is_confirmed, default: false
      t.string :address1, null: false
      t.string :address2
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.string :city, null: false
      t.string :state, null: false, limit: 2
      t.string :zipcode, null: false
      t.text :description
      t.string :phone
      t.string :email
      t.string :website
      t.jsonb :optional_data, default: {}

      t.timestamps
    end
    add_index :venues, :name
    add_index :venues, :state
    add_index :venues, :city
  end
end
