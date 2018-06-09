class CreateInstruments < ActiveRecord::Migration[5.1]
  def change
    create_table :instruments do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :instruments, :name, unique: true
  end
end
