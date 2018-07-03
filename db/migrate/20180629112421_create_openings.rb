class CreateOpenings < ActiveRecord::Migration[5.1]
  def change
    create_table :openings do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :role
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
