class CreateTestSetItems < ActiveRecord::Migration[7.0]
  def change
    create_table :test_set_items, id: :uuid do |t|
      t.references :test, null: false, foreign_key: true, type: :uuid
      t.references :test_set, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
