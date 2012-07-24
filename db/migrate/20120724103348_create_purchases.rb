class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases, :id => false  do |t|
      t.integer :user_id, :null => false
      t.integer :report_id, :null => false
      t.boolean :isFeedback
      t.boolean :isPaid
      t.integer :type, :null => false

      t.timestamps
    end
  end
end
