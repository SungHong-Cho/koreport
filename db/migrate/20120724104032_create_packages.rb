class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name, :null => false
      t.integer :price

      t.timestamps
    end
  end
end
