class CreateSecondCategories < ActiveRecord::Migration
  def change
    create_table :second_categories do |t|
      t.references :first_category, :null => false
      t.string :name, :null => false

      t.timestamps
    end
  end
end
