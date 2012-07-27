class Purchase < ActiveRecord::Base
  attr_accessible :isFeedback, :isPaid, :user_id 

  belongs_to :item, :polymorphic => true

  validates :item, :presence => true
end
