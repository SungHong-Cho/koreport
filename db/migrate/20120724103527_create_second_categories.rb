class CreateSecondCategories < ActiveRecord::Migration
  def change
    create_table :second_categories do |t|
      t.integer :first_category_id, :null => false
      t.string :name

      t.timestamps
    end
  end
end
