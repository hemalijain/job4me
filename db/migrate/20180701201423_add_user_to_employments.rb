class AddUserToEmployments < ActiveRecord::Migration[5.1]
  def change
    add_reference :employments, :user, foreign_key: true
  end
end
