class CreateDevelopers < ActiveRecord::Migration[6.0]
  def change
    create_table :developers do |t|
      t.string :name
      t.string :specialty
      t.integer :age
      t.text :bio
      t.integer :daily_rate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
