class Purchase < ActiveRecord::Base
  attr_accessible :isFeedback, :isPaid, :report_id, :type, :user_id

  belongs_to :user
  belongs_to :report

  validates :user_id, :report_id, :type, :presence => true
  belongs_to :package

end
