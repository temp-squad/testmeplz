class CreateTestAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :test_answers, id: :uuid do |t|
      t.text :answer
      t.references :exam, null: false, foreign_key: true, type: :uuid
      t.references :test, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
