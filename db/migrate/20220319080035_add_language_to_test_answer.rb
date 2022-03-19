class AddLanguageToTestAnswer < ActiveRecord::Migration[7.0]
  def change
    add_column :test_answers, :language, :string
  end
end
