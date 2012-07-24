class AddAttachmentThumbImgToPackages < ActiveRecord::Migration
  def self.up
    change_table :packages do |t|
      t.has_attached_file :thumb_img
    end
  end

  def self.down
    drop_attached_file :packages, :thumb_img
  end
end
