class CreateGigMusicianMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :gig_musician_memberships do |t|
      t.integer :gig_id, null: false
      t.integer :musician_id, null: false
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.integer :confirmation_status, default: 0
      t.integer :alt_instrument_id
      t.timestamps
    end
  end
end
