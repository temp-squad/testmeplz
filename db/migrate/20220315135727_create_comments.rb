class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.text :content
      t.references :exam, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
