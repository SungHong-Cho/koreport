class AddAttachmentDocument5ToReports < ActiveRecord::Migration
  def self.up
    change_table :reports do |t|
      t.has_attached_file :document5
    end
  end

  def self.down
    drop_attached_file :reports, :document5
  end
end
