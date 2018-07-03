class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.string :title
      t.datetime :date_range
      t.datetime :start
      t.datetime :end
      t.string :status
      t.string :color
      t.references :employment, foreign_key: true

      t.timestamps
    end
  end
end
