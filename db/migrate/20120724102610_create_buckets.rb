class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t|
      t.references :user, :null => false
      t.references :report, :null => false

      t.timestamps
    end
  end
end
