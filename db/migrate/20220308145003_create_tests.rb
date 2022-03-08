class CreateTests < ActiveRecord::Migration[7.0]
  enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

  def change
    create_table :tests, id: :uuid do |t|
      t.string :title
      t.text :description
      t.string :return_type

      t.timestamps
    end
  end
end
