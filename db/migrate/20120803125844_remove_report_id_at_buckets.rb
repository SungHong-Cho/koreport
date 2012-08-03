class RemoveReportIdAtBuckets < ActiveRecord::Migration
  def up
    remove_column :buckets, :report_id
  end

  def down
    add_column :buckets, :report_id, :integer
  end
end
