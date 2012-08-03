class AddPolymorphicToBucket < ActiveRecord::Migration
  def change
    add_column :buckets, :bucket_item_id, :integer
    add_column :buckets, :bucket_item_type, :string, default: 'Report', null: false
  end
end
