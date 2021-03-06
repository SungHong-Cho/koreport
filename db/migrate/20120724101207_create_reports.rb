class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :user, :null => false
      t.string :title
      t.string :univ
      t.string :college
      t.string :dep
      t.integer :year
      t.integer :price
      t.integer :page
      t.integer :hit
      t.integer :rate
      t.text :intro
      t.text :list
      t.text :content

      t.timestamps
    end
  end
end
