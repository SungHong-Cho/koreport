class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :user
      t.references :item, :polymorphic => { :default => 'report' }, :null => false
      t.boolean :isFeedback, :default => false
      t.boolean :isPaid, :default => false

      t.timestamps
    end
  end
end
