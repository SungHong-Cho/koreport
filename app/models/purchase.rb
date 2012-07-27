class Purchase < ActiveRecord::Base
  attr_accessible :isFeedback, :isPaid 

  belongs_to :item, :polymorphic => true

  validates :item_id, :presence => true
end
