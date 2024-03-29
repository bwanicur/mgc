class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :region_id, null: false
      t.string :url_name, null: false
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
      t.datetime :gigs_last_updated_at

      # sorcery columns
      t.string :crypted_password
      t.string :salt
      t.string :activation_state
      t.string :activation_token
      t.datetime :activation_token_expires_at
      t.string :reset_password_token
      t.datetime :reset_password_token_expires_at
      t.datetime :reset_password_email_sent_at
      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :url_name, unique: true
    add_index :users, :activation_token
    add_index :users, :reset_password_token
  end
end
