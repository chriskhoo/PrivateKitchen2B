class CreateSignups < ActiveRecord::Migration[5.0]
  def change
    create_table :signups do |t|
      t.references :event, foreign_key: true
      t.integer :guest_id
      t.boolean :accepted, null: false, default: false

      t.timestamps
    end
  end
end
