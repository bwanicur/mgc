class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :gig_musician_membership_id
      t.monetize :amount_cents
      t.string :confirmation_token
      t.datetime :confirmed_at

      t.timestamps
    end
  end
end
