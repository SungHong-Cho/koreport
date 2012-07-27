class Package < ActiveRecord::Base
  attr_accessible :name, :price, :thumb_img, :content_img

  has_and_belongs_to_many :reports
  has_many :purchases, :as => :item
  
  has_attached_file :thumb_img
  has_attached_file :content_img

  validates :name, :price, :presence => true

  def report_id=(report_id)
    @report_id = report_id
  end

  def report_id
    @report_id
  end
end
