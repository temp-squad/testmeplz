class ApplicationController < ActionController::Base
  def validate_exam
    redirect_to exam_path(@exam) if @exam.submitted?
  end
end
