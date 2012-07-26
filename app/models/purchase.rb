class Purchase < ActiveRecord::Base
  attr_accessible :isFeedback, :isPaid, :report_id, :type, :user_id

  belongs_to :user
  belongs_to :report
<<<<<<< HEAD

  validates :user_id, :report_id, :type, :presence => true
=======
  belongs_to :package
>>>>>>> ca7a8be30038b69e92988ab688d45ce7df0cb063
end
