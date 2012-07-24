class Feedback < ActiveRecord::Base
  attr_accessible :comment, :rate, :report_id, :user_id
end
