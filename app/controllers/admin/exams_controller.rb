class Admin::ExamsController < ApplicationController
  def index
    @exams = Exam.all.order("created_at DESC")
  end

  def show
    @exams = Exam.all
    @exam = Exam.find(params[:id])
  end
end
