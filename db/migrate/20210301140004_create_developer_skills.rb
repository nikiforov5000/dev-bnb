class CreateDeveloperSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :developer_skills do |t|
      t.integer :years_of_experience
      t.references :developer, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
