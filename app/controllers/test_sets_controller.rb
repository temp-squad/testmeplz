class TestSetsController < ApplicationController
  before_action :authenticate_user!

  def show
    test_set = TestSet.find(params[:id])
    test_set.company.candidates.find_or_create_by(user: current_user)
    
    exam = ExamService.create(user: current_user, tests: test_set.tests)

    redirect_to exam_path(exam)
  end
end
