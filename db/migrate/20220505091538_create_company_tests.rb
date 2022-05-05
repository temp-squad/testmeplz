class CreateCompanyTests < ActiveRecord::Migration[7.0]
  def change
    create_table :company_tests, id: :uuid do |t|
      t.references :company, null: false, foreign_key: true, type: :uuid
      t.references :test, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
