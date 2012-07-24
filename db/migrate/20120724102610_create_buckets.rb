class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t|
      t.integer :user_id, :null => false
      t.string :report_id, :null => false

      t.timestamps
    end
  end
end
