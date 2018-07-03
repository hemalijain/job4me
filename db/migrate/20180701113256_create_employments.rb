class CreateEmployments < ActiveRecord::Migration[5.1]
  def change
    create_table :employments do |t|
      t.string :name
      t.string :current_company
      t.string :ctc
      t.string :ectc
      t.string :total_experience
      t.string :relevent_experience

      t.timestamps
    end
  end
end
