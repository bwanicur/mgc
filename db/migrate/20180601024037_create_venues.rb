class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :address1, null: false
      t.string :address2
      t.decimal :latitude
      t.decimal :longitude
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
    add_index :venues, :user_id
  end
end
