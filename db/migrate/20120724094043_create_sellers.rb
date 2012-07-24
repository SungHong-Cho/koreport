class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.integer :user_id, :null => false
      t.string :name, :null => false
      t.integer :rate

      t.timestamps
    end
  end
end
