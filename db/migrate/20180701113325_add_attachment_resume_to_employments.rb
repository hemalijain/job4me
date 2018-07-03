class AddAttachmentResumeToEmployments  < ActiveRecord::Migration[5.1]
  def self.up
    change_table :employments do |t|
      t.attachment :resume
    end
  end

  def self.down
    remove_attachment :employments, :resume
  end
end
