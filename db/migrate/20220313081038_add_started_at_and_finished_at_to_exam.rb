class AddStartedAtAndFinishedAtToExam < ActiveRecord::Migration[7.0]
  def change
    add_column :exams, :started_at, :datetime
    add_column :exams, :finished_at, :datetime
  end
end
