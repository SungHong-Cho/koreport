class Seller < ActiveRecord::Base
  attr_accessible :avatar

  has_attached_file :avatar

  belongs_to :user
end
