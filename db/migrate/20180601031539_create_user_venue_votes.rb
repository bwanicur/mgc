class CreateUserVenueVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :user_venue_votes do |t|
      t.integer :user_id, null: false
      t.integer :venue_id, null: false
      t.boolean :accurate, default: true
      t.jsonb :corrections, default: {}

      t.timestamps
    end
    add_index :user_venue_votes, [:venue_id, :user_id], unique: true
  end
end
