class CreateDevelopers < ActiveRecord::Migration[6.0]
  def change
    create_table :developers do |t|
      t.string :name
      t.string :specialty
      t.integer :age
      t.text :bio
      t.integer :daily_rate
      t.references :user, null: false, foreign_key: true
      t.references :owner, references: :users, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
