class AddAttachmentContentImgToPackages < ActiveRecord::Migration
  def self.up
    change_table :packages do |t|
      t.has_attached_file :content_img
    end
  end

  def self.down
    drop_attached_file :packages, :content_img
  end
end
