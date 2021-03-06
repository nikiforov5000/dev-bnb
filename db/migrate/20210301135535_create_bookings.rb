class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :project_name
      t.date :start_date
      t.date :end_date
      t.integer :total_price
      t.references :developer, null: false, foreign_key: true
      t.references :renter, references: :users, foreign_key: { to_table: :users }
      t.string :status

      t.timestamps
    end
  end
end
