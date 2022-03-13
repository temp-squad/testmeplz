class TestsController < ApplicationController
  def show
    @exam = Exam.find(params[:exam_id])
    @test = @exam.tests.find(params[:id])
    @answer = @test.test_answers.find_by(exam_id: @exam.id)
  end
end
