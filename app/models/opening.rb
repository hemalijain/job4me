class Opening < ApplicationRecord
  belongs_to :user
  has_many :employments
  validates_presence_of :title, :description, :location , :role
end
