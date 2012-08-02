class Purchase < ActiveRecord::Base
  attr_accessible :isFeedback, :isPaid, :user_id, :item_id, :item_type

  belongs_to :user
  belongs_to :report

  validates :user_id, :item_id, :item_type, :presence => true
  belongs_to :package

  belongs_to :item, :polymorphic => true
end
