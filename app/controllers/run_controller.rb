class RunController < ApplicationController
  def create
    test_answer = TestAnswer.find_by(exam_id: params[:exam_id], test_id: params[:test_id])
    code_runner_service = CodeRunnerService.new(test_answer)
    code_runner_service.run
  end
end
