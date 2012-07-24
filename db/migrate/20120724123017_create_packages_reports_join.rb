class CreatePackagesReportsJoin < ActiveRecord::Migration
  def up
    create_table 'packages_reports', :id => false do |t|
      t.integer :package_id
      t.integer :report_id
    end
  end

  def down
    drop_table 'packages_reports'
  end
end
