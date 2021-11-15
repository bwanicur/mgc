class CreateMusicians < ActiveRecord::Migration[6.1]
  def change
    create_table :musicians do |t|
      t.integer :user_id, null: false
      t.string :email, null: false
      t.string :instrument
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone
      t.jsonb :optional_data, default: {}

      t.timestamps
    end
    add_index :musicians, %i[user_id email], unique: true
  end
end
