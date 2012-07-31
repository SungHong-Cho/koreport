class RenameRateInReportToExpertRate < ActiveRecord::Migration
  def up
    rename_column :reports, :rate, :expert_rate
  end

  def down
    rename_column :reports, :expert_rate, :rate
  end
end
