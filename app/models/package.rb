class Package < ActiveRecord::Base
  attr_accessible :name, :price

  has_and_belongs_to_many :reports
  
  has_attached_file :thumb_img
  has_attached_file :content_img
end
