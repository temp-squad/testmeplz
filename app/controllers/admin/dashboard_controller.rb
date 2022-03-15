class Admin::DashboardController < Admin::BaseController
  def index
    @exams = Exam.all.order("created_at DESC")
  end
end
