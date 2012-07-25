class AddAttachmentDocument2ToReports < ActiveRecord::Migration
  def self.up
    change_table :reports do |t|
      t.has_attached_file :document2
    end
  end

  def self.down
    drop_attached_file :reports, :document2
  end
end
