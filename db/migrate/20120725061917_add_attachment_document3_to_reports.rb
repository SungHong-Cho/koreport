class AddAttachmentDocument3ToReports < ActiveRecord::Migration
  def self.up
    change_table :reports do |t|
      t.has_attached_file :document3
    end
  end

  def self.down
    drop_attached_file :reports, :document3
  end
end
