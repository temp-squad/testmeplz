class AddTitleAndDescriptionToTestSet < ActiveRecord::Migration[7.0]
  def change
    add_column :test_sets, :title, :string
    add_column :test_sets, :description, :text
  end
end
