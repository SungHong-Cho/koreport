class AddAttachmentDocImgToDocuments < ActiveRecord::Migration
  def self.up
    change_table :documents do |t|
      t.has_attached_file :doc_img
    end
  end

  def self.down
    drop_attached_file :documents, :doc_img
  end
end
