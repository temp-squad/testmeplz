class CreateTestCases < ActiveRecord::Migration[7.0]
  def change
    create_table :test_cases, id: :uuid do |t|
      t.string :input
      t.string :expected_return
      t.references :test, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
