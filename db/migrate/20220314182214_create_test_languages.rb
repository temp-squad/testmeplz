class CreateTestLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :test_languages, id: :uuid do |t|
      t.string :language
      t.text :example
      t.text :placeholder
      t.references :test, null: true, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
