class AddUserToExam < ActiveRecord::Migration[7.0]
  def change
    add_reference :exams, :user, null: true, foreign_key: true, type: :uuid
  end
end
