class Interview < ApplicationRecord
  belongs_to :employment
  validates :employment, uniqueness: true
  validates_presence_of :title, :status
    def all_day_interview?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end
end
