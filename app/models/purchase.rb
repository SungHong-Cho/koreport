class Purchase < ActiveRecord::Base
  attr_accessible :isFeedback, :isPaid, :report_id, :type, :user_id
end
