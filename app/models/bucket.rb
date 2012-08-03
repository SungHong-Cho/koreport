class Bucket < ActiveRecord::Base
  attr_accessible :report_id, :user_id, :product

  belongs_to :user
  belongs_to :bucket_item, polymorphic: true

  validates :report_id, :user_id, :presence => true
end
