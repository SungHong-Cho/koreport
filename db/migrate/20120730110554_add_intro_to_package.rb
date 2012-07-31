class AddIntroToPackage < ActiveRecord::Migration
  def change
    add_column :packages, :intro, :text
  end
end
