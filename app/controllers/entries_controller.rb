class EntriesController < ApplicationController
  def create
    @exam = Exam.find(params[:exam_id])
    @exam.touch(:started_at)

    redirect_to exam_test_path(exan_id: @exam_id, id: @exam.tests.first.id)
  end
end
