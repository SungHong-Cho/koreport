class AddAttachmentDocument4ToReports < ActiveRecord::Migration
  def self.up
    change_table :reports do |t|
      t.has_attached_file :document4
    end
  end

  def self.down
    drop_attached_file :reports, :document4
  end
end
