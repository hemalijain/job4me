class Employment < ApplicationRecord
  has_attached_file :resume
  validates_attachment :resume, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
   validates_presence_of :name, :current_company,:ctc,:ectc,:total_experience,:relevent_experience
  belongs_to :opening
  has_one :interview
  belongs_to :user
end
