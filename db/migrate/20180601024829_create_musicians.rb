class CreateMusicians < ActiveRecord::Migration[6.1]
  def change
    create_table :musicians do |t|
      t.integer :user_id, null: false
      t.string :email, null: false
      t.string :full_name, null: false
      t.string :instrument
      t.string :phone
      t.jsonb :optional_data, default: {}
      t.integer :num_gigs, default: 0
      t.timestamps
    end
    add_index :musicians, %i[user_id email], unique: true
  end
end
