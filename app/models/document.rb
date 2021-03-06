class Document < ActiveRecord::Base
  attr_accessible :report_id, :doc_img

  belongs_to :report
  
  has_attached_file :doc_img, styles: { thumb: "100x100>" }
end
