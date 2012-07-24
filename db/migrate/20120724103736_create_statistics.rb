class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics, :id => false  do |t|
      t.integer :total_user
      t.integer :total_page
      t.integer :sold_page
      t.integer :total_income

      t.timestamps
    end
  end
end
