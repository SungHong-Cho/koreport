class Bucket < ActiveRecord::Base
  attr_accessible :report_id, :user_id

  # set_primary_keys :report_id, :user_id

  belongs_to :user
  belongs_to :report

  validates :report_id, :user_id, :presence => true
end
