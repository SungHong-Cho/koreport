class AddAttachmentContentImgToReports < ActiveRecord::Migration
  def self.up
    change_table :reports do |t|
      t.has_attached_file :content_img
    end
  end

  def self.down
    drop_attached_file :reports, :content_img
  end
end
