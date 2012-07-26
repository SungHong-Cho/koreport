class ChangeColumnBucketsReportIdTypeStringToInteger < ActiveRecord::Migration
  def up
    change_column :buckets, :report_id, :string, :type => :integer
  end

  def down
  end
end
