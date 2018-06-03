class CreateMusicians < ActiveRecord::Migration[5.1]
  def change
    create_table :musicians do |t|
      t.integer :user_id, null: false
      t.integer :linked_to_user_id
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone1, null: false
      t.string :phone2
      t.jsonb :optional_data, default: {}

      t.timestamps
    end
    add_index :musicians, [:user_id, :email], unique: true
  end
end
