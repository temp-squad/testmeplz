class CreateCompanyMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :company_members, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :company, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
