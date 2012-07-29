class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, :null => false
      t.text :content

      t.timestamps
    end
  end
end
