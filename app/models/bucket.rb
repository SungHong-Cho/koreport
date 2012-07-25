class Bucket < ActiveRecord::Base
  attr_accessible :report_id, :user_id

  self.primary_keys :report_id, :user_id

  belongs_to :user
  belongs_to :report
end
