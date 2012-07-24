class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :user_id, :null => false
      t.integer :report_id, :null => false
      t.integer :rate
      t.text :comment

      t.timestamps
    end
  end
end
