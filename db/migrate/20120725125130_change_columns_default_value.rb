class ChangeColumsDefaultValue < ActiveRecord::Migration
  def change
    change_column :purchases, :isFeedback, :boolean, :default => false
    change_column :answers, :content, :text, :null => false
    change_column :first_categories, :name, :string, :null => false
    change_column :packages, :name, :string, :null => false
    change_column :packages, :price, :integer, :null => false
    change_column :packages_reports, :package_id, :integer, :null => false
    change_column :packages_reports, :report_id, :integer, :null => false
    change_column :questions, :title, :string, :null => false
    change_column :questions, :content, :text, :null => false
    change_column :reports, :title, :string, :null => false
    change_column :reports, :price, :integer, :null => false
    change_column :reports, :page, :integer, :null => false
    change_column :reports, :price, :integer, :default => 0
    change_column :second_categories, :name, :string, :null => false
  end
end
