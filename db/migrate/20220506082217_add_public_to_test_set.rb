class AddPublicToTestSet < ActiveRecord::Migration[7.0]
  def change
    add_column :test_sets, :public, :boolean, default: false
  end
end
