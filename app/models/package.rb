class Package < ActiveRecord::Base
  attr_accessible :name, :price, :intro, :thumb_img, :content_img

  has_and_belongs_to_many :reports
  has_many :purchases, :as => :item
  has_many :buckets, :as => :bucket_item
  has_attached_file :thumb_img
  has_attached_file :content_img

  validates :name, :price, :presence => true

  def report_id=(report_id)
    @report_id = report_id
  end

  def report_id
    @report_id
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

  def original_price
    case self.price
    when 14900
      19000

    when 9900
      11400
    end
  end

  def discount
    self.price - original_price
  end
end
