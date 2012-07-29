class Purchase < ActiveRecord::Base
  attr_accessible :isFeedback, :isPaid, :user_id 

<<<<<<< HEAD
  belongs_to :user
  belongs_to :report

  validates :user_id, :report_id, :type, :presence => true
  belongs_to :package

=======
  belongs_to :item, :polymorphic => true

  validates :item, :presence => true
>>>>>>> 801ad3079b683fede7526d8d5a753059808c9a8d
end
