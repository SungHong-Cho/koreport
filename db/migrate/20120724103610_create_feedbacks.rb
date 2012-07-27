class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :user, :null => false
      t.references :report, :null => false
      t.integer :rate
      t.text :comment

      t.timestamps
    end
  end
end
