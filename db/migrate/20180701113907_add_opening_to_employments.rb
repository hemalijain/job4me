class AddOpeningToEmployments < ActiveRecord::Migration[5.1]
  def change
    add_reference :employments, :opening, foreign_key: true
  end
end
