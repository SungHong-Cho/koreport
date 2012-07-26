class ChangeColumnIsFeedbackAndIsPaidToPurchases < ActiveRecord::Migration
  def change
change_column :purchases, :isFeedback, :boolean, :default => false
change_column :purchases, :isPaid, :boolean, :default => false
  end
end
