class Feedback < ActiveRecord::Base
  attr_accessible :comment, :rate, :report_id, :user_id

  self.primary_keys :report_id, :user_id

  belongs_to :report
  belongs_to :user

  validates :comment, :presence => true
end
