class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.text :name
      t.integer :host_id
      t.date :date
      t.text :venue
      t.integer :num_guests
      t.text :cuisine
      t.text :first_course
      t.text :main_course
      t.text :dessert_course
      t.float :cost_per_pax
      t.string :picture

      t.timestamps
    end
  end
end
