class CreateFirstCategories < ActiveRecord::Migration
  def change
    create_table :first_categories do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end
end
