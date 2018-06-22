class CreateGigMusicianMemberships < ActiveRecord::Migration[5.1]
  def up
    create_table :gig_musician_memberships do |t|
      t.integer :gig_id, null: false
      t.integer :musician_id, null: false
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.integer :confirmation_status, default: 0
      t.integer :email_count, default: 0
      t.integer :sms_count, default: 0
      t.integer :alt_instrument_id
      t.timestamps
    end
  end

  def down
    drop_table :gig_musician_memberships
  end
end
