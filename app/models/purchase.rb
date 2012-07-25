class Purchase < ActiveRecord::Base
  attr_accessible :isFeedback, :isPaid, :report_id, :type, :user_id

  set_primary_keys :report_id, :user_id

  belongs_to :user
  belongs_to :report
end
