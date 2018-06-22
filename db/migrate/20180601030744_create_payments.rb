class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :gig_musician_membership_id, null: false
      t.monetize :amount
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.timestamps
    end
    add_index :payments, :gig_musician_membership_id
  end
end
