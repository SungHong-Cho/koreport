class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :report
      t.timestamps
    end
  end
end
