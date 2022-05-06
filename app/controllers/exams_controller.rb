class ExamsController < ApplicationController
  layout "exam_room"

  def show
    @exam = Exam.find(params[:id])
  end
end
