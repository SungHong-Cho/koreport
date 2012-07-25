class Purchase < ActiveRecord::Base
  attr_accessible :isFeedback, :isPaid, :report_id, :type, :user_id

  belongs_to :user
  belongs_to :report
  belongs_to :package
end
